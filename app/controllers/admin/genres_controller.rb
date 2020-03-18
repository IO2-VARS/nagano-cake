class Admin::GenresController < ApplicationController

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admin_products_path
		else
			render :index
		end
	end

	private
	def genre_params
		params.require(:genre).permit(:name, :is_invalid)
	end
end
