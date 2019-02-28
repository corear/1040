Rails.configuration.stripe = {
    :publishable_key => ENV["PK_KEY"],
    :secret_key => ENV["SK_KEY"],
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]