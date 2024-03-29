class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい' }
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい' }
  validates :read_first, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい' }
  validates :read_family, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい' }
  validates :birth, presence: true
  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
    message: 'は英数字の混合である必要があります'
  }, on: :create

  attr_accessor :birth_date

  has_many :items
  has_many :orders
end
