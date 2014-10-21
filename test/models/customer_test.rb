require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "cannot save blank" do

    customer = Customer.new
    assert_not customer.save

  end

  test "cannot save without first_name" do

    customer = get_customer_without :first_name
    assert_not customer.save

  end

  test "cannot save without last_name" do

    customer = get_customer_without :last_name
    assert_not customer.save

  end

  test "increments to one from nil" do
    customer = get_customer_without :visit_count

    customer.increment_visit

    assert_equal 1, customer.visit_count
  end

  test "increments by one from number" do

    # Customer has a visit_count of 1
    customer = get_customer_without :nil

    # Should make visit count to 2
    customer.increment_visit

    assert_equal 2, customer.visit_count
  end

  test "increments from 10 to 11" do

    customer = get_customer_without :visit_count
    customer.visit_count = 10
    customer.increment_visit

    assert_equal 11, customer.visit_count
  end

  test "cannot have an invalid email" do
    customer = get_customer_without :email
    customer.email = "john.doe"
    assert_not customer.save
  end

  test "can have valid email" do

    customer = get_customer_without :email
    customer.email = "ryan.dawkins@gmail.com"
    assert customer.save

  end

  private
  def get_customer_without attr

    customer = Customer.new

    if not attr == :first_name
      customer.first_name = "John"
    end

    if not attr == :last_name
      customer.last_name = "Doe"
    end

    if not attr == :email
      customer.email = "john.doe@gmail.com"
    end

    if not attr == :phone_number
      customer.phone_number = "(405) 123-4567"
    end

    if not attr == :visit_count
      customer.visit_count = 1
    end

    customer

  end

end
