class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = Cart.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def import
    Product.import(params[:file])
    redirect_to products_path, notice: "Products added"
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end