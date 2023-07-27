require "test_helper"

class CreateProductWorkflowTest < ActionDispatch::IntegrationTest

    test "should try to create a new product that is not diary free" do
        get "http://127.0.0.1:4000/products/new"
        assert_response :success

        post "http://127.0.0.1:4000/products", params: {product: {title: "Mango Smoothie", description: "Mango, pineapple, orange juice and youghurt", price:"2.95", stock: true, gluten_free: true, diary_free: false, months_6_to_12: false, years_1_to_2: true, years_2_to_4: true}}
        assert_response :found
        assert_select 'a', "redirected"

        get "https://127.0.0.1:400/products"
        assert_response :ok
        #puts(response.parsed_body)
        assert_select "div div", 3
        assert_select "div div p", "Title:\n    Mango Smoothie"
        assert_select "p", "Description:\n    Mango, pineapple, orange juice and youghurt"
        assert_select "p", "Price:\n    2.95"
        assert_select "p", "Stock:\n    true"
        assert_select "p", "Gluten free:\n    true"
        assert_select "p", "Diary free:\n    false"
        assert_select "p", "Months 6 to 12:\n    false"
        assert_select "p", "Years 1 to 2:\n    true"
        assert_select "p", "Years 2 to 4:\n    true"
    end

    test "should try to create a product that is not gluten free" do
        get "https://127.0.0.1:400/products/new"
        assert_response :success

        post "https://127.0.0.1:400/products", params: {product: {title: "Berry Youghurt Pot", description: "Mixed berry, granola and natural youghurt", price:"1.95", stock: true, gluten_free: false, diary_free: true, months_6_to_12: false, years_1_to_2: true, years_2_to_4: true}}
        assert_response :found
        assert_select 'a', "redirected"

        get "https://127.0.0.1:400/products"
        assert_response :ok
        assert_select "div div", 3
        assert_select "div div p", "Title:\n    Berry Youghurt Pot"
        assert_select "p", "Description:\n    Mixed berry, granola and natural youghurt"
        assert_select "p", "Gluten free:\n    false"
    end
end