class User < ApplicationRecord
  extend DisplayList
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :Lockable

  def full_name
    self.family_name + " " + self.first_name
  end
end
