require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '正常に登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角であれば登録できる' do
        @user.first_name = '桐生'
        @user.family_name = 'ココ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとlast_name_kanaが全角であれば登録できる' do
        @user.read_first = 'イオフィ'
        @user.read_family = 'イナニス'
        expect(@user).to be_valid
      end
      context '新規登録出来ない時' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it 'passwordが6文字以下では登録できない' do
          @user.password = 'test0'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'passwordが半角英数字混合での入力でないと登録できない' do
          @user.password = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password は英数字の混合である必要があります")
        end
        it 'passwordとconfirmが一致していないと登録できない' do
          @user.password = 'test123'
          @user.password_confirmation = 'test1234'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
        end
        it 'family_nameが空では登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
        end
        it 'first_nameが半角では登録できない' do
          @user.first_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
        end
        it 'family_nameが半角では登録できない' do
          @user.family_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
        end
        it 'read_firstが空では登録できない' do
          @user.read_first = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Read first は全角カタカナで入力して下さい")
        end
        it 'read_family が空では登録できない' do
          @user.read_family = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Read family は全角カタカナで入力して下さい")
        end
        it 'read_firstが半角では登録できない' do
          @user.read_first = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("Read first は全角カタカナで入力して下さい")
        end
        it 'read_family が半角では登録できない' do
          @user.read_family = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("Read family は全角カタカナで入力して下さい")
        end
        it 'read_firstが全角（ひらがな、漢字）では登録できない' do
          @user.read_first = '山田'
          @user.valid?
          expect(@user.errors.full_messages).to include("Read first は全角カタカナで入力して下さい")
        end
        it 'read_family が全角（ひらがな、漢字）では登録できない' do
          @user.read_family = '山田'
          @user.valid?
          expect(@user.errors.full_messages).to include("Read family は全角カタカナで入力して下さい")
        end
        it 'birth_dateが空では登録できない' do
          @user.birth = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth can't be blank")
        end
      end
    end
  end
end