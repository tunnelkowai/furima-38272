class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :user_id, :item_id

    validates :user_id,        presence: true
    validates :item_id,        presence: true
    validates :token,          presence: true
    validates :post_code,      presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id,  presence: true, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities, presence: true
    validates :address,        presence: true
    validates :phone_number,   presence: true, format: { with: /\A[0-9]{10,}\z/, message: "is too short" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order_id: order.id )
  end
end