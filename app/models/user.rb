class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :email

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }

    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :last_name, :first_name, format: { with: VALID_NAME_REGEX }

    VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :last_name_kana, :first_name_kana, format: { with: VALID_KANA_NAME_REGEX }
  end
  has_many :items
  has_many :purchases
end
