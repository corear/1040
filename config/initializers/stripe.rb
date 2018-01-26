Rails.configuration.stripe = {
    :publishable_key => 'pk_test_InJ001knBEjLFsG6esW6G747',
    :secret_key => 'sk_test_tz9QhDauFW71FtTOzKN99Q6c',
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]