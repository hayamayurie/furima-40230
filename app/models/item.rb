class Item < ApplicationRecord
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id
  end

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_type_id, presence: true
  validates :prefecture_id, presence: true
  validates :preparation_day_id, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :preparation_day
end
