class CategoriesController < ApplicationController

	before_filter :populate_categories

	layout "public"

	def index
		@category = Category.find(params[:id])
		@categories = Category.all.sorted
	end

	def show
		@lines = Line.all.sorted
		@category = Category.find(params[:id])
		@products = @category.products
		respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end

	end

	private

	def populate_categories
		@categories = Category.all
		@category = Category.find(params[:id])
	end		


end
