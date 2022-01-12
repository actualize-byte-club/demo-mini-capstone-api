class ProductsController < ApplicationController
  def all_products
    products = Product.all
    render json: products.as_json
  end

  def first_product
    product = Product.first
    render json: product.as_json
  end

  def second_product
    product = Product.find_by(id: 2)
    render json: product.as_json
  end
end
