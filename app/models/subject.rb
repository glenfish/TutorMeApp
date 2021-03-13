class Subject < ApplicationRecord
  belongs_to :tutor
  has_many :bookings
end
