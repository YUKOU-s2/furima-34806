require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  
  before do
    @purchase_history = FactoryBot.build(:purchase_history)
  end
  context '内容に問題ない場合' do
    it 'すべての情報があれば登録できる' do
      expect(@purchase_history).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "post_codeが空では保存ができないこと" do
      @purchase_history.post_code = " "
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("Post code can't be blank")
    end
    it "post_codeがハイフンがなくては保存ができないこと" do
      @purchase_history.post_code = "1111111"
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "area_idが空では保存ができないこと" do
      @purchase_history.area_id = nil
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("Area can't be blank")
    end
    it "area_idが1では保存ができないこと" do
      @purchase_history.area_id = 1
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("Area can't be blank")
    end
    it "cityが空では保存ができないこと" do
      @purchase_history.city = " "
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("City can't be blank")
    end
    it "house_numberが空では保存ができないこと" do
      @purchase_history.house_number = " "
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("House number can't be blank")
    end
    it "phone_numberが空では保存ができないこと" do
      @purchase_history.phone_number = " "
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberが11桁以下では保存ができないこと" do
      @purchase_history.phone_number = "0123456789"
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
    end
    it "phone_numberが11桁以上では保存ができないこと" do
      @purchase_history.phone_number = "012345678910"
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
    end
    it "tokenが空では保存ができないこと" do
      @purchase_history.token = nil
      @purchase_history.valid?
      expect(@purchase_history.errors.full_messages).to include("Token can't be blank")
    end
  end
end
