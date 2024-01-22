require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報入力がうまくいかない時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
      context '商品情報の入力がうまく行かない時' do
        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空だと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'explanationが空だと出品できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it 'categoryが未選択だと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'conditionが未選択だと出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it 'postage_typeが未選択だと出品できない' do
          @item.postage_type_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage type can't be blank")
        end
        it 'prefectureが未選択だと出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'prepare_dayが未選択だと出品できない' do
          @item.preparation_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Preparation day can't be blank")
        end
        it 'priceが空だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが全角数字だと出品できない' do
          @item.price = "２０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが¥300円以下だと出品できない' do
          @item.price = "100"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceが¥¥9,999,999以上だと出品できない' do
          @item.price = "10,000,000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'userが紐づいていなければ出品できない' do
          @item.user = nil 
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end