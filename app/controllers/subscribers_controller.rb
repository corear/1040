class SubscribersController < ApplicationController
    
    before_filter :authenticate_user!
    
    def new
        
    end
    
    def changePlan
        require 'date'
        Stripe.api_key = ENV["SK_KEY"]
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
        Stripe.api_key = ENV["SK_KEY"]

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
        
        
        
        
        if (Promo.pluck(:code).include? current_user.promo.downcase) then
            
            if (Promo.find_by_code(current_user.promo.downcase).used >= Promo.find_by_code(current_user.promo.downcase).maximum) then
            
                redirect_to "/secure/payment", alert: "This code has been used the maximum number of times! Change or remove your promo code below."
            
            else
                
                token = params[:stripeToken]
            
        customer = Stripe::Customer.create(
            :card => token,
            :email => current_user.email
        )
                
                subs = Stripe::Subscription.create(
                :customer => "#{customer.id}",
                :items => [
                    {
                        :plan => "#{current_user.promo.downcase}"
                    }
                ]
            )
            
            
            current_user.subscribed = true
            current_user.stripeid = customer.id
            current_user.subsriptionId = subs.id
            current_user.save
            
            @promo = Promo.find_by_code(current_user.promo.downcase)
            @promo.used = Promo.find_by_code(current_user.promo.downcase).used + 1
            @promo.save
            
            redirect_to "/home"
            
                
            end
            
            
            
        elsif (current_user.promo == "") then
        
        token = params[:stripeToken]
            
        customer = Stripe::Customer.create(
            :card => token,
            :email => current_user.email
        )
        
            subs = Stripe::Subscription.create(
                :customer => "#{customer.id}",
                :items => [
                    {
                        :plan => "9001"
                    }
                ]
            )
            
            current_user.subscribed = true
        current_user.stripeid = customer.id
        current_user.subsriptionId = subs.id
        current_user.save
        
        redirect_to "/home"
        
        else
        
        redirect_to "/secure/payment", alert: "No such promo code found! Change or remove your code below."
        end
        
        
        
        
    end
end
