class Booking < ApplicationRecord
  belongs_to :tutor
  belongs_to :student
  belongs_to :subject
end
