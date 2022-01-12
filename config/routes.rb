Rails.application.routes.draw do
  get "/all_products" => "products#all_products"
  get "/first_product" => "products#first_product"

  get "/any_product" => "products#any_product"
end