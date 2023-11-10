class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = current_user.orders.build
    @order.book_orders.build
    @books = Book.all 
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.save
    redirect_to orders_path
  end

  # def add_to_cart
  #   @order = current_user.orders.last || current_user.orders.create
  #   @book = Book.find(params[:book_id])
  #   @order.books << @book unless @order.books.include?(@book)

  #   redirect_to @order, notice: 'Book added to cart.'
  # end

    private

  def order_params
    params.require(:order).permit(:status, book_orders_attributes: [:id, :book_id, :quantity, :_destroy])
  end
end
