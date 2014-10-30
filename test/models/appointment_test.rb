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

  test "can't save without datetime" do
    appointment = get_without :date
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

    appointment

  end

end
