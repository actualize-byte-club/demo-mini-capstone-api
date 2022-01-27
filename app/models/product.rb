class Product < ApplicationRecord
  
  # validates :name, presence: true, uniqueness: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :description, presence: true, length: { in: 10..700 }
  # validates :quantity, presence: true, numericality: true

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories
  
  # def categories
  #   product_categories.map do |handshake|
  #     handshake.category
  #   end
  # end

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  scope :title_search, ->(search_terms) { where("name ILIKE ?", "%#{search_terms}%") if search_terms }

  scope :discounted, ->(check_discount) { where("price < ?", 10) if check_discount }

  scope :sorted, ->(sort, sort_order) {
    if sort == "price"
      if sort_order == "desc"
        order(price: :desc)
      else
        order(:price)
      end
    else
      order(id: :asc)
    end
  }

end