require 'test_helper'

class ServiceTest < ActiveSupport::TestCase

  test "can't save blank" do
    service = Service.new
    assert_not service.save
  end

  test "can't save without name" do
    service = get_without :name
    assert_not service.save
  end

  test "can't save without a cost" do
    service = get_without :cost
    assert_not service.save
  end

  test "can't save decimal with more than 2 precision" do
    service = get_without :cost
    service.cost = 10.999
    assert_not service.save
  end

  test "can't save negative values" do
    service = get_without :cost
    service.cost = -1
    assert_not service.save
  end

  private
  def get_without attr

    service = Service.new

    if attr == :name
      service.name = "Pedicure"
    end

    if attr == :cost
      service.cost = 10.99
    end

    service
  end

end
