FactoryBot.define do
  factory :item do
    association :user
    item_name             {'test'}
    introduction          {'test'}
    category_id           {2}
    condition_id          {2}
    charge_id             {2}
    area_id               {2}
    delivery_time_id      {2}
    price                 {300}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
