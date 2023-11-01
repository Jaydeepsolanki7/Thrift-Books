class CheckoutController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def create
    begin
      @book = Book.find(params[:id])
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
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
        success_url: root_url,
        cancel_url: root_url,
      )

      redirect_to session.url, allow_other_host: true
  
    rescue Exception => e
      e.class 
    end
  end
end