class Appointment < ActiveRecord::Base

  belongs_to :customer

  validates :customer_id, presence: true, :numericality => {
    :only_integer => true,
    :greater_than => 0
    }
  validates :employee_id, :numericality => {
    :only_integer => true,
    :allow_blank => true,
    :greater_than => 0
    }

  validates :date, presence: true

end
