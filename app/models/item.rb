class Item < ApplicationRecord
  validates :image,           presence: true
  validates :title,           presence: true, length: { maximum: 40 }
  validates :description,     presence: true, length: { maximum: 1000 }
  validates :price,           presence: true, numericality: { message: 'is invalid. Input half-width characters' }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: ' is out of setting range' }
  validates :user_id,         presence: true
  validates :category_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one    :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship
end
