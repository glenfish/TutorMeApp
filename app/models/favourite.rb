class Favourite < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
end
