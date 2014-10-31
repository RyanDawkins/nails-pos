class Employee < ActiveRecord::Base

  belongs_to :role

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role_id, :numericality => {
    :only_integer => true,
    :allow_blank => true,
    :greater_than => 0
    }

end
