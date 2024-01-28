class OrderFrom
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do

    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)',allow_blank: true}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank",allow_blank: true }
    validates :city
    validates :street
    validates :phone_number, format: {with: /\A\d{10,11}\z/,allow_blank: true}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order=Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end
end