class Product < ApplicationRecord
  
  validates :name, presence: true

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


# Product Model Validations
# name presence/uniqueness
# price presence/numericality (not a negative number)
# image_url presence
# description length range (in)
# quantity presence