class Schedule < ActiveRecord::Base

  validates :appointment_id, presence: true, :numericality => {
    :only_integer => true,
    :greater_than => 0
  }

  validates :service_id, presence: true, :numericality => {
    :only_integer => true,
    :greater_than => 0
  }

  validates :cost, presence: true,
    :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }

  validates :name, presence: true

end
