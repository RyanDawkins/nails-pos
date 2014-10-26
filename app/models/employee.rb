class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, :numericality => {
    :only_integer => true,
    :allow_blank => true,
    :greater_than => 0
    }
end
