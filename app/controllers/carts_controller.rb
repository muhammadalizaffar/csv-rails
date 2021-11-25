class CartsController < ApplicationController
  def index
    @carts = Cart.all
    # @carts = @product

  end
  
  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new
    @cart.quantity = params[:quantity]
    @cart.products << Product.find(params[:product_id])

    #@cart = Cart.create(cart_params)
    @cart.save
    redirect_to products_path
  end

  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy

    session[:cart_id] = nil
    
    redirect_to root_path
  end

  private
  def cart_params
    params.require(:cart).permit(:product_id, :quantity)
  end
end
