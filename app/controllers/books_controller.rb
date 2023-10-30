class BooksController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create]
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    if current_user.has_role? :author
      @book = current_user.books.new(book_params)
      @book.category_id = params[:category_id]
      if @book.save
        redirect_to category_path(@book.category_id), notice: 'Book was successfully created.'
      else
        render :new
      end
    else
      redirect_to root_path, alert: 'You do not have the required role to create a book.'
    end
  end

  def edit
    @category = Category.find_by(id: params[:category_id])
    @book = Book.find(params[:id])
  end

  def update
    if current_user.has_role? :author
      @book = Book.find(params[:id])
      if (@book.author_id==current_user.id)
        if @book.update(book_params)
          redirect_to category_path(@book.category_id), notice: 'Book was successfully edit.'
        else
          render :edit
        end
      end
    end
  end

  private

    def book_params
      params.require(:book).permit(:title, :description, :price, :cover_image, :availability, :rating, :quantity)
    end
end
