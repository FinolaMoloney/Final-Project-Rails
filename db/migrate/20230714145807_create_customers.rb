class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :phone_number
      t.string :email_address
      t.string :password

      t.timestamps
    end
  end
end
