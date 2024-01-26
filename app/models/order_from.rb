class OrderFrom
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building_name, :phone_number, :order_id, :item_id, :user_id

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, presence: true
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true
  
  def save
    order=Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end
end