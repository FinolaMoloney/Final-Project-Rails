class AddDetailsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :address, :string
    add_column :orders, :phone_number, :integer
  end
end
