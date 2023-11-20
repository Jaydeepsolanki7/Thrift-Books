class OrderMailer < ApplicationMailer
  def order_created_email(order)
    @order = order
    mail(to: @order.user.email, subject: "Order Created")
  end
end
