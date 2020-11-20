class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id 
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
