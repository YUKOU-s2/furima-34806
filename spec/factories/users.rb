FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    first_name            {'太郎'}
    family_name           {'田中'}
    first_name_kana       {'タロウ'}
    family_name_kana      {'タナカ'}
    password              {'00000a'}
    password_confirmation {password}
    dob                   {'2000-10-10'}
  end
end