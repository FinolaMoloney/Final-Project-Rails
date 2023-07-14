require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "Description", with: @product.description
    check "Diary free" if @product.diary_free
    check "Gluten free" if @product.gluten_free
    check "Months 6 to 12" if @product.months_6_to_12
    fill_in "Price", with: @product.price
    check "Stock" if @product.stock
    fill_in "Title", with: @product.title
    check "Years 1 to 2" if @product.years_1_to_2
    check "Years 2 to 4" if @product.years_2_to_4
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "Description", with: @product.description
    check "Diary free" if @product.diary_free
    check "Gluten free" if @product.gluten_free
    check "Months 6 to 12" if @product.months_6_to_12
    fill_in "Price", with: @product.price
    check "Stock" if @product.stock
    fill_in "Title", with: @product.title
    check "Years 1 to 2" if @product.years_1_to_2
    check "Years 2 to 4" if @product.years_2_to_4
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
