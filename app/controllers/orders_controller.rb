class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    orders = current_user.orders
    render json: orders, include: "carted_products.product"
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    subtotal = carted_products.map { |carted_product| carted_product.quantity * carted_product.product.price }.reduce(:+)
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if order.save
      carted_products.update_all(order_id: order.id, status: "purchased")
      render json: order, include: "carted_products.product"
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    order = current_user.orders.find(params[:id])
    if order
      render json: order, include: "carted_products.product"
    else
      render json: {}, status: :unauthorized
    end
  end
end
