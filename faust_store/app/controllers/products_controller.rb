class ProductsController < ApplicationController
require 'csv'

  def list
    @products = fetch_products
  
  end

  def detail
    @products = fetch_products
    @product = @products.find{|c| c.pid == params[:pid]}
   
  end

  def fetch_products
    @products = []
    CSV.foreach("/Users/Spoonflower/Desktop/rails-small-business-cdmackeyfree/faust_store/faust_inventory.csv", headers: true) do |row|
    
      product = Product.new
      product.item = row.to_h["item"]
      product.pid = row.to_h["pid"]
      product.description = row.to_h["description"]
      product.price = row.to_h["price"]
      product.condition = row.to_h["condition"]
      product.dimension_w = row.to_h["dimension_w"]
      product.dimension_h = row.to_h["dimension_h"]
      product.dimension_l = row.to_h["dimension_l"]
      product.img_file = row.to_h["img_file"]
      product.quantity = row.to_h["quantity"]
      product.category = row.to_h["category"]

      @products << product
    end
    @products
  end


end
