class PurchaseHistory
  include ActiveModel::Model
  attr_accessor :price, :user_id,:post_code, :area_id, :city, :house_number, :building, :phone_number, :token, :item_id

  with_options presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/} do
    validates :post_code,format: {message: "is invalid. Include hyphen(-)"}
  end
  with_options numericality: {other_than: 1, message: "can't be blank"} do
   validates :area_id
  end
  with_options presence: true do
   validates :user_id
   validates :item_id
   validates :token
   validates :city
   validates :phone_number ,length: {is: 11}, numericality: {only_integer: true}
   validates :house_number
  end
  
  def save
    purchase_management = PurchaseManagement.create(item_id: item_id,user_id: user_id)
    Purchase.create(post_code: post_code,area_id: area_id,  city: city,  house_number: house_number, building: building, phone_number: phone_number, purchase_management_id: purchase_management.id) 
  end
end