class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8, maximum: 16 }

  # 1人のユーザーは複数の本を登録できる。ユーザーを削除すると、そのユーザーが登録した本も一緒に削除される
  has_many :books, dependent: :destroy
end
