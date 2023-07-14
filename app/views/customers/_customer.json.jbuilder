json.extract! customer, :id, :first_name, :last_name, :address, :phone_number, :email_address, :password, :created_at, :updated_at
json.url customer_url(customer, format: :json)
