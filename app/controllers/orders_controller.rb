class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: :payment_completed
  
  def index
    @orders = current_user.orders
    if current_user.has_role?(:admin)
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = current_user.orders.build
    @order.book_orders.build
    @books = Book.all 
  end

  def create_order
    begin
      @book = Book.find(params[:id])
      session = Stripe::Checkout::Session.create(
        customer: current_user.stripe_customer_id,
        # client_reference_id: current_user.name,
        payment_method_types: ['card'],
        metadata: {
    
        book_id: @book.id,
        user_id: current_user.id
        },
        line_items: [{
          price_data: {
            currency: 'usd',
            product_data: {
              name: @book.title,
            },
            unit_amount: @book.price,
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "#{root_url}orders",
        cancel_url: root_url,
      )

      redirect_to session.url, allow_other_host: true
  
    rescue Exception => e
      e.class
    end
  end

  def payment_completed
    payload= request.body.read
    event= nil
    endpoint_secret= 'whsec_ETEKbnJX3ixLLLOxQnXeWhr4nxjD59uT'
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
      rescue  JSON::ParserError => e
      status 400
      return
    end

    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      @user = session.metadata.user_id
      book_id = session.metadata.book_id
      @order = Order.create(user_id: @user.to_i)
      @order.book_orders.create(book_id: book_id, quantity: 1)
      OrderMailer.order_created_email(@order).deliver_now
    end
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
