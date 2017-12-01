class CartsController < ApplicationController
  def show
    @cart = Cart.find_by(params[:id])
  end

  def checkout
    current_cart.checkout
    current_user.update(current_cart: nil)
    redirect_to cart_path
  end
end
