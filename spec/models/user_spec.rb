require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー登録ができる時' do
    it  do
      expect(@user).to be_valid
   end
  end
  context 'ユーザー登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
      it 'first_nameが空では登録できない' do
        @user.first_name = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
   end
   it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = '' 
    @user.valid?
    expect(@user.errors.full_messages).to include "First name kana can't be blank"
   end
   it 'family_name_kanaが空では登録できない' do
    @user.family_name_kana = '' 
    @user.valid?
    expect(@user.errors.full_messages).to include "Family name kana can't be blank"
   end 
     it 'passwordが空では登録できない' do
    @user.password = '' 
    @user.valid?
    expect(@user.errors.full_messages).to include "Password can't be blank"
   end
   it 'dobが空では登録できない' do
    @user.dob = '' 
    @user.valid?
    expect(@user.errors.full_messages).to include "Dob can't be blank"
   end
   it 'emailが@が含まれていれば登録できない' do
    @user.email = 'testexample'  
    @user.valid?
    expect(@user.errors.full_messages).to include "Email is invalid"
  end
  it "重複したemailが存在する場合登録できないこと" do
    FactoryBot.create(:user, email: "test@mail.com")
    user = FactoryBot.build(:user, email: "test@mail.com")
    user.valid?
    expect(user.errors[:email]).to include "has already been taken"
  end
   it 'passwordが5文字以下では登録できない' do
    @user.password = '123ab'  
    @user.valid?
    expect(@user.errors.full_messages).to include "Password は半角6以上英文字・数字それぞれ１文字以上含む必要があります"
   end
   it 'passwordが英字のみでは登録できない' do
    @user.password = 'aaaaaa'  
    @user.valid?
    expect(@user.errors.full_messages).to include "Password は半角6以上英文字・数字それぞれ１文字以上含む必要があります"
   end
   it 'passwordが数字のみでは登録できない' do
    @user.password = '111116'  
    @user.valid?
    expect(@user.errors.full_messages).to include "Password は半角6以上英文字・数字それぞれ１文字以上含む必要があります"
   end
   it 'passwordが全角では登録できない' do
    @user.password = '111ＡＡＡ'  
    @user.valid?
    expect(@user.errors.full_messages).to include "Password は半角6以上英文字・数字それぞれ１文字以上含む必要があります"
   end
   it 'first_nameが全角でないと登録できない' do
    @user.first_name = 'aaa' 
    @user.valid?
    expect(@user.errors.full_messages).to include "First name is invalid"
   end
   it 'family_nameが全角でないと登録できない' do
   @user.family_name = 'aaa'  
   @user.valid?
   expect(@user.errors.full_messages).to include "Family name is invalid"
  end
  it 'first_name_kanaが全角カタカナでないと登録できない' do
    @user.first_name_kana = '太郎' 
    @user.valid?
    expect(@user.errors.full_messages).to include "First name kana is invalid"
   end
   it 'family_name_kanaが全角カタカナでないと登録できない' do
   @user.family_name_kana = '田中'  
   @user.valid?
   expect(@user.errors.full_messages).to include "Family name kana is invalid"
  end
  end
end
