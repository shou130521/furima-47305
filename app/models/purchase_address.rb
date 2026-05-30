class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は3桁ハイフン4桁で入力してください' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数字で入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    purchase = Purchase.create(
      user_id: user_id,
      item_id: item_id
    )

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end

end