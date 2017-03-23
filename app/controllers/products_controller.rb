class ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def create
		@product = Product.create(prod_params)
		redirect_to products_path
	end

	def index
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory > 0
	  	render plain: true
	  else
	  	render plain: false
	  end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private
  def prod_params
  	params.require(:product).permit(:name, :price, :inventory, :description)
  end
end
