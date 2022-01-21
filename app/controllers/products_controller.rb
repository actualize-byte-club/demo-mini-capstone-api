class ProductsController < ApplicationController
  def index
    products = Product
      .title_search(params[:search])
      .discounted(params[:discount])
      .sorted(params[:sort], params[:sort_order])
    # if params[:search]
    #   products = products.where("name iLike ?", "%#{params[:search]}%")
    # end
    # if params[:discount]
    #   products = products.where("price < ?", 10)
    # end
    # if params[:sort] == "price"
    #   if params[:sort_order] == "desc"
    #     products = products.order(price: :desc)
    #   else
    #     products = products.order(:price)
    #   end
    # else
    #   products = products.order(:id)
    # end
    render json: products
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      quantity: params[:quantity]
    )
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.quantity = params[:quantity] || product.quantity
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product destroyed successfully!" }
  end
end