class CategoriesController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:new, :create]


  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @books = Book.where(category_id: @category.id)
  end

  def new
    @category = Category.new
    authorize! :create, @category
  end

  def create
    @category = Category.create(category_params)
    authorize! :create, @category
    if @category.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :cat_image)
    end
end
