class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :quantity, :is_discounted?, :tax, :total

  belongs_to :supplier
  has_many :images
end