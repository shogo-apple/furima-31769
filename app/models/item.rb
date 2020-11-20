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

  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_day_id, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  
  validates :image, presence: true
end
