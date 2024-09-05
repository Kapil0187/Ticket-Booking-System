class BookingMailer < ApplicationMailer
  def booking_email(current_user)
    @user = current_user
    mail(to: @user.email, subject: 'Your seats are booked')
  end
end
