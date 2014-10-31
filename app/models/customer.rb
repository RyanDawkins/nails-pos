class Customer < ActiveRecord::Base

  has_many :appointment

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def increment_visit
    if self.visit_count.nil?
      self.visit_count = 0
    end
    self.visit_count = self.visit_count + 1
  end

end
