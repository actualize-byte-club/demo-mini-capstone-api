class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :image_url, :is_discounted?, :tax, :total
end