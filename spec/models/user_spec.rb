require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailが@が含まれていれば登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = 'testexample'  
      user.valid?
      expect(user.errors.full_messages).to include "Email is invalid"
    end
      it 'first_nameが空では登録できない' do
        user = FactoryBot.build(:user)  # Userのインスタンス生成
        user.first_name = ''  # first_nameの値を空にする
        user.valid?
        expect(user.errors.full_messages).to include "First name can't be blank"
    end
    it 'family_nameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.family_name = ''  # family_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Family name can't be blank"
   end
   it 'first_name_kanaが空では登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.first_name_kana = ''  # first_name_kanaの値を空にする
    user.valid?
    expect(user.errors.full_messages).to include "First name kana can't be blank"
   end
   it 'family_name_kanaが空では登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.family_name_kana = ''  # family_name_kanaの値を空にする
    user.valid?
    expect(user.errors.full_messages).to include "Family name kana can't be blank"
   end 
     it 'encrypted_passwordが空では登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.encrypted_password = ''  # encrypted_passwordの値を空にする
    user.valid?
    expect(user.errors.full_messages).to include "Password can't be blank"
   end
   it 'dobが空では登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.dob = ''  # dobの値を空にする
    user.valid?
    expect(user.errors.full_messages).to include "Dob can't be blank"
   end
   it 'encrypted_passwordが5文字以下では登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.encrypted_password = '12345'  
    user.valid?
    expect(user.errors.full_messages).to include "Password can't be blank"
   end
   it 'encrypted_passwordが英字のみでは登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.encrypted_password = 'aaaaaa'  
    user.valid?
    expect(user.errors.full_messages).to include "Password can't be blank"
   end
   it 'encrypted_passwordが数字のみでは登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.encrypted_password = '111116'  
    user.valid?
    expect(user.errors.full_messages).to include "Password can't be blank"
   end
   it 'first_nameが全角でないと登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.first_name = 'aaa'  # first_nameの値を空にする
    user.valid?
    expect(user.errors.full_messages).to include "First name is invalid"
   end
   it 'family_nameが全角でないと登録できない' do
   user = FactoryBot.build(:user)  # Userのインスタンス生成
   user.family_name = 'aaa'  # family_nameの値を空にする
   user.valid?
   expect(user.errors.full_messages).to include "Family name is invalid"
  end
  it 'first_name_kanaが全角カタカナでないと登録できない' do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.first_name = '太郎'  # first_nameの値を空にする
    user.valid?
    expect(user.errors.full_messages).to include "First name kana is invalid"
   end
   it 'family_name_kanaが全角カタカナでないと登録できない' do
   user = FactoryBot.build(:user)  # Userのインスタンス生成
   user.family_name = '太郎'  # family_nameの値を空にする
   user.valid?
   expect(user.errors.full_messages).to include "Family name kana is invalid"
  end
  end
end