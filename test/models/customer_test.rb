require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  
  setup do
    @customer = Customer.new
    @jane_customer = customers(:jane)
  end

  test "should create a customer" do
    assert @customer.save
  end

  test "find customer" do
    @customer.first_name = "Finola"
    @customer.last_name = "Moloney"
    @customer.address = "Boxtown"
    @customer.phone_number = 12345679
    @customer.email_address = "finola1997@gmail.com"
    @customer.password = "123"
    @customer.save

    expected_customer = Customer.find(@customer.id)
    assert_equal(expected_customer.first_name, @customer.first_name)
    assert_equal(expected_customer.last_name, @customer.last_name)
    assert_equal(expected_customer.address, @customer.address)
    assert_equal(expected_customer.phone_number, @customer.phone_number)
    assert_equal(expected_customer.email_address, @customer.email_address)
    assert_equal(expected_customer.password, @customer.password)
  end

  test "should delete a customer" do
    @customer.save
    assert_difference("Customer.count", -1) do
      @customer.destroy
    end
  end

  test "should update a customer" do
    customer_update_address = "Cork"
    @jane_customer.update({
      address:  customer_update_address
    })
    assert_equal(customer_update_address, @jane_customer.address)
  end
end
