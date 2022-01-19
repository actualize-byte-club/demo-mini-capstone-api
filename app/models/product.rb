class Product < ApplicationRecord
  
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :image_url, presence: true
  validates :description, presence: true, length: { in: 10..500 }
  validates :quantity, presence: true, numericality: true

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end