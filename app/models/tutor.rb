class Tutor < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :favourites
  has_many :subjects
  has_many :bookings
  has_many :students, through: :bookings
  has_many :payments, through: :bookings

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :address_1, presence: true
  validates :postcode, presence: true
  validates :state, presence: true
  validates :country, presence: true

end
