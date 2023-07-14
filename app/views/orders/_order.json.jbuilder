json.extract! order, :id, :title, :description, :price, :quantity, :email_address, :created_at, :updated_at
json.url order_url(order, format: :json)
