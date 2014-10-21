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
