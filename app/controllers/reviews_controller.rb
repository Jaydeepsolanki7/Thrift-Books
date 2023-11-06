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
        flash[:danger] = "You are the author of the book"
      end
    else
      flash[:danger] = "Log in first"
    end
  end


  private

    def review_params
      params.require(:review).permit(:body, :user_id, :book_id)
    end 
end
