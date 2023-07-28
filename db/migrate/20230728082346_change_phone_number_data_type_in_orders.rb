class ChangePhoneNumberDataTypeInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :phone_number, :string
  end
end
