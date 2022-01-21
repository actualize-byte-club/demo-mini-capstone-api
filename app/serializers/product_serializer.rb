class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :image_url, :quantity, :is_discounted?, :tax, :total

  belongs_to :supplier
end