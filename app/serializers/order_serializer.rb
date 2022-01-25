class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :subtotal, :tax, :total

  belongs_to :product
end
