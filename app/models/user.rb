class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         validates :name, presence: true
         validates :profile, presence: true
         validates :my_bike, presence: true
         validates :residence, presence: true

         has_many :comments
         has_many :bikes

end
