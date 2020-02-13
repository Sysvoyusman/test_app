class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #You have to delete the registerable from this Otherwise it willnt allow admin to create new user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
