class Appointment < ActiveRecord::Base

  validates :customer_id, presence: true, :numericality => {
    :only_integer => true,
    :greater_than => 0
    }

  validates :date, presence: true

end
