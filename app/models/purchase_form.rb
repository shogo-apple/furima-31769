class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :home_number, :apartment_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :home_number
    # validates :phone_number,numericality: { only_integer: true, length: { minimum: 11 } } 
    validates :phone_number, length: { maximum: 11 }
    validates :token
  end

    

    validates :shipping_area_id, numericality: { other_than: 1 }



  def save
    # purchasの情報を保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # delivery_addressの情報を保存
    DeliveryAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, home_number: home_number, apartment_name: apartment_name, phone_number: phone_number, purchase_id: purchase.id)
  end


end