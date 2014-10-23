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

  test "cannot save without role" do
    employee = get_without :role
    assert_not employee.save
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
    if not attr == :role
      employee.role = 1
    end
    return employee
  end
end
