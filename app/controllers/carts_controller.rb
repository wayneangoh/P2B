class CartsController < ApplicationController
  def show
    current_order.order_items.destroy_all
    @order_items = current_order.order_items
  end
end
