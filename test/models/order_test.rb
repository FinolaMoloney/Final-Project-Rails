require "test_helper"

class OrderTest < ActiveSupport::TestCase

  setup do
    @order = Order.new
    @order_1 = orders(:finolas_order)
    @order_2 = orders(:janes_order)
  end

  test "should create an order" do
    assert @order.save
  end

  test "find order" do
    @order.email_address = "finola1997@gmail.com"
    @order.save

    expected_order = Order.find(@order.id)
    assert_equal(expected_order.email_address, @order.email_address)
  end

  test "should delete order" do
    @order.save
    assert_difference("Order.count", -1) do
      @order.destroy
    end
  end

  test "should update order" do
    order_update_title = "Apple Puree"
    @order_1.update({
      title:  order_update_title
    })
    assert_equal(order_update_title, @order_1.title)
  end

  test "should create order with order items" do
    janes_order = Order.new(
      title: @order_2[:title],
      description: @order_2[:description],
      price: @order_2[:price],
      quantity: @order_2[:quantity],
      email_address: @order_2[:email_address]
    )
  
    # Create the first order item
    order_item_one = janes_order.order_items.build(
      title: order_items(:order_item_one)[:title],
      description: order_items(:order_item_one)[:description],
      price: order_items(:order_item_one)[:price],
      quantity: order_items(:order_item_one)[:quantity]
    )
  
    # Create the second order item
    order_item_two = janes_order.order_items.build(
      title: order_items(:order_item_two)[:title],
      description: order_items(:order_item_two)[:description],
      price: order_items(:order_item_two)[:price],
      quantity: order_items(:order_item_two)[:quantity]
    )
  
    assert janes_order.save
  
    assert_equal 2, janes_order.order_items.count
    assert order_item_one.persisted?
    assert order_item_two.persisted?
  end
end