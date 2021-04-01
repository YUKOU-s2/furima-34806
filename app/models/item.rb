class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :deliveryTime
  belongs_to :area

  PRICE_REGEX =/[\d]/
  with_options presence: true do
  validates :item_name
  validates :introduction
  validates :image
  validates :price ,
   numericality:{greater_than: 299, less_than: 10000000},
     format: { with: PRICE_REGEX}
  end

  with_options presence: true, numericality: { other_than: 1 }  do
   validates :category_id
   validates :condition_id
   validates :charge_id
   validates :delivery_time_id
   validates :area_id
  end


end
