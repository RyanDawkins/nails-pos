require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  test "cannot save blank" do
    employee = Employee.new
    assert_not employee.save
  end

  test "cannot save without first_name" do
    employee = get_without :first_name
    assert_not employee.save
  end

  test "cannot save without last_name" do
    employee = get_without :last_name
    assert_not employee.save
  end

  test "can save blank role" do
    employee = get_without :role_id
    assert employee.save
  end

  test "can only save integer role" do
    employee = get_without :role_id
    employee.role_id = "bob"
    assert_not employee.save
  end

  test "cannot save as an integer 0" do
    employee = get_without :role_id
    employee.role_id = 0
    assert_not employee.save
  end

  test "can save numbers greater than 0" do
    employee = get_without :role_id
    employee.role_id = 1
    assert employee.save
  end

  private
  def get_without attr
    employee = Employee.new

    if not attr == :first_name
      employee.first_name = "John"
    end
    if not attr == :last_name
      employee.last_name = "Doe"
    end
    if not attr == :role_id
      employee.role_id = 1
    end
    return employee
  end
end
