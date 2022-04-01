class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, 
         :validatable, :confirmable, :recoverable, :lockable
end
