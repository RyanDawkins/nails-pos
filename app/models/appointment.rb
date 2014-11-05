class Appointment < ActiveRecord::Base

  belongs_to :customer
  belongs_to :employee

  validates :customer_id, presence: true, :numericality => {
    :only_integer => true,
    :allow_blank => false,
    :greater_than => 0
    }
  validates :employee_id, :numericality => {
    :only_integer => true,
    :allow_blank => false,
    :greater_than => 0
    }

  validates :date, presence: true

end
