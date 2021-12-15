class Booking < ApplicationRecord
  belongs_to :teacher
  belongs_to :user

  validates :date, presence: true, uniqueness: { scope: :user_id }
  validates :teacher_id, uniqueness: { scope: :date }
end
