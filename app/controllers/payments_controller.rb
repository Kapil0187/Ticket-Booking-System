# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
  def create
    @amount = 500 

    payment_intent = Stripe::PaymentIntent.create({
      amount: @amount,
      currency: 'usd',
      confirmation_method: 'manual',
      confirm: false,
    })
    
    render json: { client_secret: payment_intent.client_secret }
  end

  def confirm
    payment_intent = Stripe::PaymentIntent.retrieve(params[:payment_intent_id])

    payment_intent.confirm({
      payment_method: params[:payment_method_id]
    })

    if payment_intent.status == 'requires_action' || payment_intent.status == 'requires_source_action'
     
      render json: { requires_action: true, client_secret: payment_intent.client_secret }
    else
      
      render json: { success: true }
    end
  end
end
