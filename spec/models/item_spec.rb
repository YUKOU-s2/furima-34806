require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '出品ができる時' do
    it  do
      expect(@item).to be_valid
   end
  end
   context '出品ができない時' do
    it 'item_nameが空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end
    it 'introductionが空では登録できない' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Introduction can't be blank"
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'category_idが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it 'condition_idが1では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition must be other than 1"
    end
    it 'charge_idが空では登録できない' do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Charge can't be blank"
    end
    it 'charge_idが1では登録できない' do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Charge must be other than 1"
    end
    it 'area_idが空では登録できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Area can't be blank"
    end
    it 'area_idが1では登録できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Area must be other than 1"
    end
    it 'delivery_time_idが空では登録できない' do
      @item.delivery_time_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery time can't be blank"
    end
    it 'delivery_time_idが1では登録できない' do
      @item.delivery_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery time must be other than 1"
    end
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceが300より下は登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than 299"
    end
    it 'priceが10000000より上は登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than 10000000"
    end
    it 'priceが半角英語は登録できない' do
      @item.price = 'AAAA'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'priceが全角文字は登録できない' do
      @item.price = 'あああ'
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'priceが半角英数字混合は登録できない' do
      @item.price = '11AA'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
  end
end
