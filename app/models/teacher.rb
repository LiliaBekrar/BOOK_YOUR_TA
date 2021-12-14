class Teacher < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  SPECIALITIES = ["Front-end", "Back-end", "Ruby",  "JavaScript", "HTML-CSS", "RAILS", "SQL", "DataSciences"]
  validates :specialty, presence: true, inclusion: {in: SPECIALITIES}
  validates :description, presence: true, length: { minimum: 5, maximum: 250 }
  validates :city_name, presence: true
  validates :price, presence: true
  has_one_attached :photo
end
