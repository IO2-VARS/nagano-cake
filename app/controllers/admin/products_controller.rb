class Admin::ProductsController < ApplicationController

before_action :authenticate_admin!


	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to admin_products_path
	end


	private
	def product_params
		params.require(:product).permit(:image, :name, :description, :genre_id, :price, :is_soldout)
	end
end
