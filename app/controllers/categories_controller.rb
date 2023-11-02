class CategoriesController < ApplicationController
  before_action :admin?, only: [:new, :create, :edit, :update]

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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :cat_image)
    end
end
