class User < ApplicationRecord
  has_many :reservation
  extend DisplayList

  ## validations
  # validates :first_name,:family_name, presence: true,
  #                                     format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は漢字/ひらがな/カタカナで入力してください"},
  #                                     length: { maximum: 10, allow_blank: true }
  # validates :first_name_reading,:family_name_reading, presence: true,
  #                                                     format: { with: /\A[ぁ-んー－]+\z/, message: "はひらがなで入力してください" },
  #                                                     length: { maximum: 10, allow_blank: true }
  # validates :password, presence: true,
  #                      length: { minimum: 8 },
  #                      format: {with: /\A[\w\-]+\z/, message: "は半角英数字8文字以上で入力してください"},
  #                      allow_nil: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, # Question　registable これ無効にしても大丈夫？
         :recoverable, :rememberable, :validatable,
         :timeoutable, :Lockable

  def full_name
    self.family_name + " " + self.first_name
  end



  scope :search_information, -> (keyword) {
    where("family_name LIKE :keyword OR
           first_name LIKE :keyword OR
           family_name LIKE :keyword OR
           first_name LIKE :keyword OR
           email LIKE :keyword ", keyword: "%#{keyword}%")       ##　Question もっとスマートに書きたい
  }
end
