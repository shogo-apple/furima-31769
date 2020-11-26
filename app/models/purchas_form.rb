class PurchasForm
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :home_number, :apartment_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city, format: {with: /\A[^ -~｡-ﾟ]+\z/}
    validates :home_number
    validates :phone_number
  end

    validates :shipping_area_id, numericality: { other_than: 1 }



  def save
    # purchasの情報を保存
    Purchas.create(user: user, item: item)
    # delivery_addressの情報を保存
    DeliveryAddress.create(postal_code: postal_code, shipping_id: shipping_id, city: city, home_number: home_number, apartment_name: apartment_name, phone_number: phone_number,user_id: user.id)
  end


end