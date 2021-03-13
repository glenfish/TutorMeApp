class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites
  has_many :bookings
  has_many :tutors, through: :favourites
  has_one :tutor, through: :bookings
  has_one :payment, through: :bookings
end
