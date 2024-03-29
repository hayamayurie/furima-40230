class PostageType < ActiveHash::Base
  self.data = [
    { id: 1, postage_type: '---' },
    { id: 2, postage_type: '着払い（購入者負担）' },
    { id: 3, postage_type: '送料込み（出品者負担）' }
  ]

  include ActiveHash::Associations
  has_many :items
end
