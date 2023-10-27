class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @books = Book.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new, status: :see_other
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :cat_image)
    end
end
