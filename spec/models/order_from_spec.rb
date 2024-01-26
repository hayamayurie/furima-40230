require 'rails_helper'

RSpec.describe OrderFrom, type: :model do
  before do
    @order_from = FactoryBot.build(:order_from)
  end

  describe '商品購入入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば購入出来る' do
        expect(@order_from).to be_valid
      end
      it '電話番号が11桁だと購入出来る' do 
        @order_from.phone_number = '10293847561'
        expect(@order_from).to be_valid
      end
      it '郵便番号通り３桁-4桁だと購入出来る' do 
        @order_from.postal_code = '340-8765'
        expect(@order_from).to be_valid
      end
      context '商品情報入力がうまくいかない時' do
       it '郵便番号が空だと購入出来ない' do 
        @order_from.postal_code = ''
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Postal code can't be blank")
       end
       it '郵便番号に（-）がないと購入出来ない' do 
        @order_from.postal_code = 1234567
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
       end
       it '郵便番号通り３桁-4桁でないと購入出来ない' do 
        @order_from.postal_code = 123-456
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
       end
       it '都道府県が”---”を選択すると購入出来ない' do 
        @order_from.prefecture_id = 1
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Prefecture can't be blank")
       end
       it '市区町村が空だとと購入出来ない' do 
        @order_from.city = ''
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("City can't be blank")
       end
       it '番地が空だとと購入出来ない' do 
        @order_from.street = ''
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Street can't be blank")
       end
       it '電話番号が空だとと購入出来ない' do 
        @order_from.phone_number = ''
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Phone number can't be blank")
       end
       it '電話番号が10桁だとと購入出来ない' do 
        @order_from.phone_number = 102938475
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Phone number is invalid")
       end
       it '電話番号が12桁だとと購入出来ない' do 
        @order_from.phone_number = 102938475612
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Phone number is invalid")
       end
       it 'tokenが空だとと購入出来ない' do 
        @order_from.token = ''
        @order_from.valid?
        expect(@order_from.errors.full_messages).to include("Token can't be blank")
       end
    end
   end
  end
end
