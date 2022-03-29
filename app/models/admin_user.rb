class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  self.inheritance_column = :_type_disabled
  # devise :database_authenticatable, 
  #        :recoverable, :rememberable, :validatable
end
