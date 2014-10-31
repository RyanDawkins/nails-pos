require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase

  test "can't save blank" do
    appointment = Appointment.new
    assert_not appointment.save
  end

  test "can't save without a customer_id" do
    appointment = get_without :customer_id
    assert_not appointment.save
  end

  test "can't save customer_id with a string" do
    appointment = get_without :customer_id
    appointment.customer_id = "Bob"
    assert_not appointment.save
  end

  test "can't save customer_id with a < 1 integer" do
    appointment = get_without :customer_id
    appointment.customer_id = 0
    assert_not appointment.save
  end

  test "can't save employee_id < 1" do
    appointment = get_without :employee_id
    appointment.employee_id = 0
    assert_not appointment.save
  end

  test "can't save employee_id as a string" do
    appointment = get_without :employee_id
    appointment.employee_id = "bob"
    assert_not appointment.save
  end

  test "can't save without employee_id" do
    appointment = get_without :employee_id
    assert_not appointment.save
  end

  test "can't save without datetime" do
    appointment = get_without :date
    assert_not appointment.save
  end

  test "can't save invalid date" do
    appointment = get_without :date
    appointment.date = "bob"
    assert_not appointment.save
  end

  def get_without attr

    appointment = Appointment.new

    if attr == :customer_id
      appointment.customer_id = 1
    end

    if attr == :date
      appointment.date = DateTime.now
    end

    if attr == :employee_id
      appointment.employee_id = 1
    end

    appointment

  end

end
