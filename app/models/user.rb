class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nick_name,       presence: true
  validates :last_name,       presence: true,
                              format: { with: /\A[ぁ-ゔァ-ヴ一-龥々ー]/, message: 'is invalid. Input full-width characters' }
  validates :first_name,      presence: true,
                              format: { with: /\A[ぁ-ゔァ-ヴ一-龥々ー]/, message: 'is invalid. Input full-width characters' }
  validates :last_name_kana,  presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :birthday,        presence: true

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }

  has_many :items
  # has_many :orders
end
