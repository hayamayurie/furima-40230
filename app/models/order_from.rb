class OrderFrom
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building_name, :phone_number, :item_id, :user_id, :token

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)',allow_blank: true}
  validates :prefecture_id, presence: true,  numericality: { other_than: 1, message: "can't be blank",allow_blank: true }
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, presence: true,format: {with: /\A\d{10,11}\z/,allow_blank: true}
  validates :token, presence: true
  
  def save
    order=Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end
end