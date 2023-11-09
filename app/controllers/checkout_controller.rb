class CheckoutController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def create
    begin
      @book = Book.find(params[:id])
      session = Stripe::Checkout::Session.create(
        customer: current_user.stripe_customer_id,
        # client_reference_id: current_user.name,
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'inr',
            product_data: {
              name: @book.title,
            },
            unit_amount: @book.price,
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "#{root_url}/checkout/success",
        cancel_url: root_url,
      )

      redirect_to session.url, allow_other_host: true
  
    rescue Exception => e
      e.class 
    end
  end

  def success; end
end