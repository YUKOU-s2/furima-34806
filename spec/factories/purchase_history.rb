FactoryBot.define do
  factory :purchase_history do
    post_code     {'111-1111'}
    area_id       {2}
    city          {"港区1-1-1"}
    house_number  {'1-2-3'}
    building      {'マンション'}
    phone_number  {'00000000000'}
    token         {"tok_abcdefghijk00000000000000000"}
 end
end
