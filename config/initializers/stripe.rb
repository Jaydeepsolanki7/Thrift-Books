Rails.configuration.stripe = { 
  :publishable_key => "pk_test_51O57SVBNTM37rp88fhbCt9PP9VpXZ1lFrvltVsMhLM3JqVVtoUJL6ITZYDaIW6uP2HdGZlRkxb4KXCgWdoPotjVF00XI0N3NeL",
  :secret_key => "sk_test_51O57SVBNTM37rp88RLBWcY7WcgVMZEOewPHbsJvXZvivRQAvhGaZ7hrg7RKQD1jUoLxrDSHGIIiVZAZLl36n8DXC00cz6elgon"
} 
Stripe.api_key = Rails.configuration.stripe[:secret_key]