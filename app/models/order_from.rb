class OrderFrom
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building_name, :phone_number, :order_id, :item_id, :user_id

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, presence: true,format: {with: /\A\d{10,11}\z/}
  
  def save
    order=Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end
end