class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :deliveryTime
  belongs_to :area

  with_options numericality: { other_than: 1 }  do
   validates :category_id
   validates :condition_id
   validates :charge_id
   validates :delivery_time_id
   validates :area_id
  end
   PRICE_REGEX =/\A(?=.*?[\d])+\z/
   validates :price,presence: true,
     numericality: { maximum: 300,maximum: 9999999 },
     format: { with: PRICE_REGEX}
end
