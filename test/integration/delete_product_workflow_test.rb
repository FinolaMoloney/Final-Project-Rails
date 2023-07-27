require "test_helper"

class DeleteProductWorkflowTest < ActionDispatch::IntegrationTest

    test "should delete a product" do
        product = products(:porridge)

        get "/products"
        assert_response :success
        assert_select "div div", 2

        delete "/products/#{product.id}"
        assert_select 'a', "redirected"
        assert_response :found

        get "/products"
        assert_response :success
        assert_select "div div", 1
    
    end
end