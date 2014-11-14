class Admin::CategoriesController < ApplicationController

	layout "admin"

	before_action :confirm_logged_in

	def index
		@categories = Category.all.sorted
    respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @category }
    end
	end

	def new
		@category = Category.new({:name => "Default"})
		@category_count = Category.count + 1
	end
  
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
  end
	def create
    # Instantiate a new object using form parameters
    @category = Category.new(category_params)
    # Save the object
    if @category.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Category created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @category_count = Category.count + 1
      render('new')
    end
  end

  def edit
  	@category = Category.find(params[:id])
  	@category_count = Category.count
  end

  def update
    # Find an existing object using form parameters
    @category = Category.find(params[:id])
    # Update the object
    if @category.update_attributes(category_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Product Category updated successfully."
      redirect_to(:action => 'index')
    else
      # If update fails, redisplay the form so user can fix problems
      @category_count = Category.count
      render('edit')
    end
  end

  def delete
  	@category = Category.find(params[:id])
  end

  def destroy
  	category = Category.find(params[:id]).destroy
  	flash[:notice] = "Product Category '#{category.name}' has been removed successfully."
  	redirect_to(:action => 'index')
  end


  private

  def category_params
      # same as using "params[:category]", except that it:
      # - raises an error if :category is not present
      # - allows listed attributes to be mass-assigned
      params.require(:category).permit(:name, :position, :note, :description,:visible, :created_at, :upadted_at, :banner, :permalink, {:product_ids => []})
    end

end