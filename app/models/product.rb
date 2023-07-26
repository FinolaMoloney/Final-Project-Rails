class Product < ApplicationRecord
  def get_product_status
    if(self.gluten_free)
      return "true"
    else
      return "false"
    end
  end
end
