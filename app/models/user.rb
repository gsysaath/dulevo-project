class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses_teachers, dependent: :destroy
  has_many :courses_dealers, dependent: :destroy
  has_many :courses_participants, dependent: :destroy
end
