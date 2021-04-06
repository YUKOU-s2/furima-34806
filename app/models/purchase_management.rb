class DonationAddress
  include ActiveModel::Model
  attr_accessor :price, :user_id,:post_code, :area_id, :city, :house_number, :building, :phone_number

  with_options presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/} do
    validates :user_id
    validates :price
    validates :phone_number
    validates :postal_code,format: { "is invalid. Include hyphen(-)"}
  end
  with_options numericality: {other_than: 0, message: "can't be blank"} do
   validates :area_id, 
   validates :user_id
  end
  def save
    donation = Donation.create(price: price, user_id: user_id)
    Address.create(post_code: post_code, prefecture: prefecture, area_id: area.id, city: city, house_number: house_number, building: building, phone_number: phone_number, donation_id: donation.id) 
  end
end