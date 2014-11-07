require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "cannot save blank" do
    schedule = Schedule.new
    assert_not schedule.save
  end

  test "can't save without an appointment_id" do
    schedule = get_without :appointment_id
    assert_not schedule.save
  end

  test "can't save appointment_id with a string" do
    schedule = get_without :appointment_id
    schedule.appointment_id = "Kyle"
    assert_not schedule.save
  end

  test "can't save appointment_id with a < 1 integer" do
    schedule = get_without :appointment_id
    schedule.appointment_id = 0
    assert_not schedule.save
  end

  test "can't save without a service_id" do
    schedule = get_without :service_id
    assert_not schedule.save
  end

  test "can't save service_id with a string" do
    schedule = get_without :service_id
    schedule.service_id = "Kyle"
    assert_not schedule.save
  end

  test "can't save service_id with a < 1 integer" do
    schedule = get_without :service_id
    schedule.service_id = 0
    assert_not schedule.save
  end

  test "can't save without name" do
    schedule = get_without :name
    assert_not schedule.save
  end

  test "can't save without cost" do
    schedule = get_without :cost
    assert_not schedule.save
  end

  test "can't save with more that 2 decimal percision" do
    schedule = get_without :cost
    schedule.cost = 10.999
    assert_not schedule.save
  end

  private
  def get_without attr
    schedule = Schedule.new

    unless attr == :appointment_id
      schedule.appointment_id = 1
    end

    unless attr == :service_id
      schedule.service_id = 1
    end

    unless attr == :name
      schedule.name = "manicure"
    end

    unless attr == :cost
      schedule.cost = 10.99
    end

    schedule

  end

end
