class ProductsController < ApplicationController
    def index
      if params[:search].present?
        search = params[:search]
        @products = Product.where("name LIKE ?", "%#{search}%")
      else
        @products = Product.all
        @order_item = current_order.order_items.new
    end
  end
end
