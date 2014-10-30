class Service < ActiveRecord::Base

  validates :name, presence: true
  validates :cost,
    presence: true,
    :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ },
    :numericality => {
      :greater_than_or_equal_to => 0
    }

end
