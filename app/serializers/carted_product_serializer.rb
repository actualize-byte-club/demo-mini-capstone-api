class CartedProductSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :status, :order_id, :user_id
  
  belongs_to :product
end
