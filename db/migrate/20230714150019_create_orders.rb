class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :title
      t.string :description
      t.string :price
      t.integer :quantity
      t.string :email_address

      t.timestamps
    end
  end
end
