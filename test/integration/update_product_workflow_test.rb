require "test_helper"

class UpdateProductWorkflowTest < ActionDispatch::IntegrationTest

    test "should edit the price of the lasagne product" do
        product = products(:lasagne)
        get "/products/#{product.id}/edit"
        assert_response :success

        patch "/products/#{product.id}", params: {product: {title: "lasagne", price: "5.95"}}
        assert_select 'a', "redirected"
        assert_response :found

        get "/products"
        assert_response :success
        assert_select "div div", 2
        assert_select "div div p", "Title:\n    lasagne"
        assert_select "p", "Price:\n    5.95"
    end
end