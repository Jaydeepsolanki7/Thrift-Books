class BooksController < ApplicationController
  before_action :author?, only: [:new, :create, :edit, :update]

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
    @book = current_user.books.new(book_params)
    @book.category_id = params[:category_id]
    if @book.save
      redirect_to category_path(@book.category_id), notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    @category = Category.find_by(id: params[:category_id])
    unless @book.author_id==current_user.id
      flash[:danger] = "You are not a author of this book"
      redirect_to category_book_path(@book)
    end
  end

  def update
    @book = Book.find(params[:id])
    if (@book.author_id==current_user.id)
      if @book.update(book_params)
        redirect_to category_path(@book.category_id), notice: 'Book was successfully edit.'
      else
        render :edit
      end
    end
  end

  def search
    @query = params[:q]
    @books = Book.where('title LIKE ?', "%#{@query}%")
  end
  

  private

    def book_params
      params.require(:book).permit(:title, :description, :price, :cover_image, :availability, :rating, :quantity)
    end
end
