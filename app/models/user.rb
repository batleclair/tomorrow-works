class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :candidates
  has_one_attached :photo
  has_many :cadidatures
  has_one :company
  has_many :candidature_notes
end
