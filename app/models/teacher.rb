class Teacher < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true, length: { minimum: 5, maximum: 250 }
  validates :price, presence: true
  has_one_attached :photo
end
