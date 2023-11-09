# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all 
  end
  
  def new
    @order = current_user.orders.build
    @book = Book.find_by(id: params[:book_id])
    @books = Book.all
    @order.book_orders.build
  end

  def create
    debugger
    @order = current_user.orders.build(order_params)
    @order.save
    redirect_to @order 
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(book_orders_attributes: [:book_id, :quantity])
  end
end
