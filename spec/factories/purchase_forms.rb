FactoryBot.define do
  factory :purchase_form do
    postal_code       { '123-4567' }
    shipping_area_id  { 2 }
    city              { '東京都' }
    home_number      { '1-1' }
    apartment_name     { '東京ハイツ' }
    phone_number      { '09012345678' }
    
  end
end
