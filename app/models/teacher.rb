class Teacher < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  include PgSearch::Model

  SPECIALITIES = ["Front-end", "Back-end", "Ruby", "JavaScript", "HTML-CSS", "RAILS", "SQL", "DataSciences"]
  CITIES = Teacher.all.map { |teacher| teacher.city_name }.uniq

  validates :specialty, presence: true, inclusion: {in: SPECIALITIES}
  validates :description, presence: true, length: { minimum: 5, maximum: 250 }
  validates :city_name, presence: true
  geocoded_by :city_name
  after_validation :geocode, if: :will_save_change_to_city_name?
  validates :price, presence: true
  validates :user_id, uniqueness: true
  has_one_attached :photo

  pg_search_scope :search, against: [ :specialty, :city_name ]
end
