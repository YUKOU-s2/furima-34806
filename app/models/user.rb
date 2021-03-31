class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         ZENKAKU_REGEXP  = /\A[ぁ-んァ-ヶ一-龥々]+\z/
         KATAKANA_REGEXP  = /\A[ァ-ヶー－]+\z/
         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/
         
         with_options presence: true do
          with_options format: { with: ZENKAKU_REGEXP } do
         validates :first_name
         validates :family_name
        end
         with_options format: { with: KATAKANA_REGEXP } do
         validates :first_name_kana
         validates :family_name_kana
         end
         validates :nickname
         validates :dob
       end
         validates :password,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角6以上英文字・数字それぞれ１文字以上含む必要があります"}

             has_many :items
end
