class RenameTypeToBustype < ActiveRecord::Migration[7.1]
  def change
    rename_column :buses, :type, :bustype
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
