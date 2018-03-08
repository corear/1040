class PagesController < ApplicationController
  
  def change_card
    @user = User.find(params[:id])
    @user.update_attribute(:card_number, params[:card_number])
    @user.update_attribute(:card_cvv, params[:card_cvv])
    @user.update_attribute(:card_exp_month, params[:card_exp_month])
    @user.update_attribute(:card_exp_year, params[:card_exp_year])
    @user.update_attribute(:card_name, params[:card_name])
    redirect_to "/user/#{@user.id}"
  end
    
  def index
  end
  
  def user
    @user = User.find(params[:id])
    @possibleAnswers = Response.all.where("user_id = ?", params[:id])
  end
  
  def goodbye
    @possibleAnswers = Response.all.where("user_id = ?", params[:id])
  end
  
  def send_order_mail
    UserMailer.signup_confirmation_admin(current_user).deliver
    redirect_to "/home"
  end
  
  def enact_banhammer
    UserMailer.enact_banhammer(User.find(params[:id])).deliver
    @u = User.find(params[:id])
    @u.banhammer = true
    @u.save
    redirect_to "/admin", :notice => "🔨 The Banhammer has been dropped on #{@u.email}."
  end
  
  def lift_banhammer
    UserMailer.lift_banhammer(User.find(params[:id])).deliver
    @u = User.find(params[:id])
    @u.banhammer = false
    @u.save
    redirect_to "/admin", :notice => "🔨 The Banhammer has been lifted from #{@u.email}."
  end
  
  def send_payment_change
    UserMailer.payment_change(current_user).deliver
    redirect_to "/home", :notice => "An email has been sent to the administrator informing them of your wish to change payment."
  end
  
  def send_two_week
    user = Admin.find_chaps(User.all.where("two_week = ? OR two_week = ?", false, "false"))
    UserMailer.two_week(user).deliver
    user.two_week = true
    user.save!
    redirect_to "/admin", :notice => "An email has been successfully sent to #{user.email}."
  end
  
  def forget_two_week
    user = Admin.find_chaps(User.all.where("two_week = ? OR two_week = ?", false, "false"))
    user.two_week = true
    user.save!
    redirect_to "/admin", :alert => "A two week email will never be sent to #{user.email}."
  end

  def home
    @perc = ((current_user.progress.to_f/Lesson.count)*100).round
    @lessons = Lesson.all
    @possibleAnswers = Response.all.where("user_id = ?", current_user.id)
  end

  def lessons
    @lesson = Lesson.find(params[:id])
  end

  def admin
    require "date"
    @short_users = User.all.where.not(id:1).where("created_at > ?", 6.months.ago).where(completed: [false,"false"], enrolled: [true, "true"]).order("created_at ASC")
    @midTerm_users = User.all.where.not(id:1).where.not("lower(promo) = ?","1040onthehouse").where(created_at:7.months.ago..6.months.ago, completed: [false, "false"], auto_renew: [true, "true"], enrolled: [true, "true"]).order(:created_at)
    @long_users = User.all.where.not(id:1).where("created_at < ?", 6.months.ago).where(completed: [false, "false"], auto_renew: [false, "false"], enrolled: [true, "true"]).order("created_at ASC")
    @completed_users = User.all.where(completed: true).order("created_at ASC")
    @banned_users = User.all.where(banhammer: true).order("created_at ASC")
    @inactive_users = User.all.where(completed: [false, "false"], enrolled: [false, "false"]).order("created_at ASC")
    @newLesson = Lesson.new
    @newPromo = Promo.new
    @lessons = Lesson.all.order("created_at DESC")
    @poor = Admin.find_chaps(User.all.where("two_week = ? OR two_week = ?", false, "false"))
  end
  
  def addPayment
    begin
      Stripe::Plan.retrieve("#{current_user.promo.downcase}")
    rescue
    else
    @x = Stripe::Plan.retrieve("#{current_user.promo.downcase}")
        if @x.amount.to_i == 0 && (Promo.find_by_code(current_user.promo.downcase).used < Promo.find_by_code(current_user.promo.downcase).maximum) then
           
        
        customer = Stripe::Customer.create(
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
            
        redirect_to '/home'
      
            else
      end
    end
  end
  
  def quiz
    @questions = Question.all.where("quiz_id = ?", params[:id])
    @lesson = Lesson.find(params[:id])
    @possibleAnswers = Response.all.where("user_id = ?", current_user.id)
    @respond = Response.new
    @completed = "true"
    @corr = 0
    
    params[:num] = @questions.count
    for @q in @questions do
      for @ans in Answer.all.where("question_id =?", @q.id) do
        if (@ans.correct == true)
          params["correct#{@q.id}"] = @ans.content
        end
      end
    end
  end
end
