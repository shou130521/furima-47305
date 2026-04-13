class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 正規表現
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  # ニックネーム・生年月日
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  # 名前（全角）
  with_options presence: true, format: { with: VALID_NAME_REGEX } do
    validates :last_name
    validates :first_name
  end

  # カナ（カタカナ）
  with_options presence: true, format: { with: VALID_KANA_REGEX } do
    validates :last_name_kana
    validates :first_name_kana
  end

  # パスワード（英数字混合）
  validates :password, format: { with: VALID_PASSWORD_REGEX }, if: :password_required?

end
