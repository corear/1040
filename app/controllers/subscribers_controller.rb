class SubscribersController < ApplicationController
    
    before_filter :authenticate_user!
    
    def new
        
    end
    
    def changePlan
        require 'date'
        Stripe.api_key = "sk_test_tz9QhDauFW71FtTOzKN99Q6c"
        user = User.find(params[:user])
        
        if (user.subsriptionId) then
            if (Stripe::Subscription.retrieve("#{user.subsriptionId}")) then
                sub = Stripe::Subscription.retrieve("#{user.subsriptionId}")
                sub.delete
            end
        end
        
        subs = Stripe::Subscription.create(
          :customer => "#{user.stripeid}",
          :trial_end => "#{Time.at(user.created_at + 7.months).to_i}",
          :items => [
            {
              :plan => "1020",
            },
          ]
        )
        
        
        user.subsriptionId = subs.id
        user.auto_renew = false
        user.save
        
        redirect_to "/admin"
    end
    
    def remove
        Stripe.api_key = "sk_test_tz9QhDauFW71FtTOzKN99Q6c"

        if (current_user.subsriptionId) then
            if (Stripe::Subscription.retrieve("#{current_user.subsriptionId}")) then
                sub = Stripe::Subscription.retrieve("#{current_user.subsriptionId}")
                sub.delete
            end
        end
    
        current_user.enrolled=false
        current_user.save
        
        redirect_to "/overview"
    end
    
    def update
        
        
        token = params[:stripeToken]
            
        customer = Stripe::Customer.create(
            :card => token,
            :email => current_user.email
        )
        
        if (current_user.promo.downcase == "1040onthehouse") then
            subs = Stripe::Subscription.create(
                :customer => "#{customer.id}",
                :items => [
                    {
                        :plan => "1040oth"
                    }
                ]
            )
            
        else
        
            subs = Stripe::Subscription.create(
                :customer => "#{customer.id}",
                :items => [
                    {
                        :plan => "9001"
                    }
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
