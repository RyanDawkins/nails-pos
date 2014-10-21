class Customer < ActiveRecord::Base

  attr_accessor :visit_count

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def increment_visit
    if @visit_count.nil?
      @visit_count = 0
    end
    @visit_count = @visit_count + 1
  end

end
