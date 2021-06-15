class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password users # テーブルにパスワード保存時、パスワードを暗号化して保存

  has_many :passwords
  # has_many :creations

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # validates :password_digest,
  #           format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
