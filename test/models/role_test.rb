require 'test_helper'

class RoleTest < ActiveSupport::TestCase

  test "cannot be empty" do
    role = Role.new
    assert_not role.save
  end

  test "cannot save with empty name" do
    role = Role.new
    role.name = ""
    assert_not role.save
  end

end
