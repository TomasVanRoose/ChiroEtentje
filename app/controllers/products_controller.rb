class ProductsController < ApplicationController
	

	def index
		@categories = Category.all
	end

	def new
		@product = Product.new
		@categories = Category.all
	end

	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to products_path
	end

	private
	def product_params
		params.require(:product).permit(:name, :price, :category_id)
	end

end
