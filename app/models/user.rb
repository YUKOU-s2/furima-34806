class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       with_options presence: true do
         ZENKAKU_REGEXP  = /\A[\p[ぁ-んァ-ヶ一-龥々]\u{30fc}]+\z/
         validates :first_name, format: { with: ZENKAKU_REGEXP }
         validates :family_name, format: { with: ZENKAKU_REGEXP }
         KATAKANA_REGEXP  = /\A[ァ-ヶー－]+\z/
         validates :first_name_kana, format: { with: KATAKANA_REGEXP }
         validates :family_name_kana, format: { with: KATAKANA_REGEXP }
         validates :nickname
         validates :dob
       end
         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/
         validates :password,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角6以上英文字・数字それぞれ１文字以上含む必要があります"}

end
