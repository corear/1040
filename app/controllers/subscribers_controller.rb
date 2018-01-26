class SubscribersController < ApplicationController
    
    before_filter :authenticate_user!
    
    def new
        
    end
    
    def remove
        Stripe.api_key = "sk_test_tz9QhDauFW71FtTOzKN99Q6c"

        sub = Stripe::Subscription.retrieve("#{current_user.subsriptionId}")
        sub.delete
        
        current_user.enrolled=false
        current_user.save
        
        redirect_to "/overview"
    end
    
    def update
        
        
        token = params[:stripeToken]
        
        if (current_user.stripeid != nil) then
            customer = Stripe::Customer.create(
            card: token,
            email: current_user.email
        )
        
    else
        customer = Stripe::Customer.create(
            card: token,
            email: current_user.email
        )
        
        subs = Stripe::Subscription.create(
  :customer => "#{customer.id}",
  :items => [
    {
      :plan => "9001",
    },
  ]
)
        
        end
        
        
        
        current_user.subscribed = true
        current_user.stripeid = customer.id
        current_user.subsriptionId = subs.id
        current_user.save
        
        redirect_to "/home"
    end
end
