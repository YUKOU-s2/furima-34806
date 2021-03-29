FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    first_name            {'test'}
    family_name           {'test'}
    first_name_kana       {'test'}
    family_name_kana      {'test'}
    encrypted_password    {'000000'}
    password_confirmation {password}
    dob                   {'2000-10-10'}
  end
end