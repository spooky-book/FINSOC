class Event < ActiveRecord::Base
  validates :date, presence: true
  validates :title, 
    presence: true,
    uniqueness: {
      scope: :date,
      message: "Event name must be unique for a given date."
    }
end
