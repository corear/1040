Rails.configuration.stripe = {
    :publishable_key => 'pk_live_iWfaNvo4VftiD6b6a4B5mmM9',
    :secret_key => 'sk_live_fz5MdsT6GolOPhgeEuvTYw5i',
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]