class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :user, :item

    validates :user,           presence: true
    validates :item,           presence: true
    validates :post_code,      presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id,  presence: true, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities, presence: true
    validates :address,        presence: true
    validates :phone_number,   presence: true, format: { with: /\A[0-9]{10,}\z/, message: "is too short" }
    validates :phone_number,   format: { with: /\A[0-9]{,11}\z/ }
    validates :phone_number,   numericality: { message: "is invalid. Input only number" }

  def save
    order = Order.create(user: user.id, item: item.id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order: order.id )
  end
end