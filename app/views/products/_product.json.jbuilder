json.extract! product, :id, :title, :description, :price, :stock, :gluten_free, :diary_free, :months_6_to_12, :years_1_to_2, :years_2_to_4, :created_at, :updated_at
json.url product_url(product, format: :json)
