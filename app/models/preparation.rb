class Preparation < ActiveHash::Base
  self.data = [
    { id: 1, preparation: '---' },
    { id: 2, preparation: '1~2日で発送' },
    { id: 3, preparation: '2~3日で発送' },
    { id: 4, preparation: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
