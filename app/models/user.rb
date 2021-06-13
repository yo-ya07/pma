class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password users # テーブルにパスワード保存時、パスワードを暗号化して保存
  
end
