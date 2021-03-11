class Profile < ApplicationRecord
  belongs_to :tutor
  has_one_attached :photo
end
