class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @category = Category.find(params[:category_id])
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    if @review.user_id = current_user.id
      if @review.user_id != @book.author_id
        @review.save
        redirect_to category_book_path(@category, @book)
        flash[:success] = "review is created"
      else
        redirect_to request.referer
        flash[:danger] = "You are the author of the book"
      end
    else
      flash[:danger] = "Log in first"
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @book = @category.books.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to category_book_path(@category, @book)
  end
  
  private

    def review_params
      params.require(:review).permit(:body, :user_id, :book_id)
    end 
end
