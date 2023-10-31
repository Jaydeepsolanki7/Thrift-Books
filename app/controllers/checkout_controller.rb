class CheckoutController < ApplicationController
  def create
    debugger
    book = Book.find(params[:book_id])  # Load the book you want to sell
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: book.title,
        price_data: {
          currency: 'usd',
          product_data: {
            name: book.title,  # Use the book title here
          },
          unit_amount: book.price_in_cents,  # Convert book price to cents
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: root_path,
      cancel_url: root_path,
    )

    render json: { id: session.id }
  end
end
