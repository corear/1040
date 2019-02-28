Rails.configuration.stripe = {
    :publishable_key => ENV["PK_TEST"],
    :secret_key => ENV["SK_TEST"],
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]