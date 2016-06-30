class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  helper_method :current_order


  def current_order
    if !session[:order_id].nil?
      cur_order = Order.find_by(id: session[:order_id])
    end

    if cur_order.blank?
      cur_order = Order.new
      #if user_signed_in then order.user = current_user... order.save
    end

    return cur_order
  end

  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) << :name
  devise_parameter_sanitizer.for(:account_update) << :name
end

end
