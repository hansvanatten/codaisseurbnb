class User < ApplicationRecord
  has_many :rooms, dependent: :destroy

  has_one :profile
  has_many :bookings, dependent: :destroy
  has_many :booked_rooms, through: :bookings, source: :rooms

  def has_profile?
        profile.present? && !profile.id.nil?
  end

  def full_name
    profile.full_name
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
