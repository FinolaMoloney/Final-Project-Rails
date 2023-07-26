require "test_helper"

class ProductTest < ActiveSupport::TestCase
  
  setup do
    @product = Product.new
    @porridge_product = products(:porridge)
  end

  test "should create a product" do
    assert @product.save
  end

  test "find product" do
    @product.title = "Porridge"
    @product.description = "Porridge Oats"
    @product.save

    expected_product = Product.find(@product.id)
    assert_equal(expected_product.title, @product.title)
    assert_equal(expected_product.description, @product.description)
  end

  test "should delete a product" do
    @product.save
    assert_difference("Product.count", -1) do
      @product.destroy
    end
  end

  test "should update a product" do
    product_update_title = "Porridge with berries"
    @porridge_product.update({
      title:  product_update_title
    })
    assert_equal(product_update_title, @porridge_product.title)
  end

  test "should be gluten free when true" do
    porridge_product = products(:porridge)
    assert_equal(porridge_product.get_product_status(), "true")
  end

  test "should not be gluten free when false" do
    lasagne_product = products(:lasagne)
    assert_equal(lasagne_product.get_product_status(), "false")
  end

end
