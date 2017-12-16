class PagesController < ApplicationController
    
  def index
  end
  
  def send_order_mail
    UserMailer.signup_confirmation_admin(current_user).deliver
    redirect_to "/admin"
  end
  
  def send_payment_change
    UserMailer.payment_change(current_user).deliver
    redirect_to "/home", :notice => "An email has been sent to the administrator informing them of your wish to change payment."
  end
  
  def send_two_week
    user = Admin.find_chaps(User.all.where('two_week = ? OR two_week = ?', false, 'false'))
    UserMailer.two_week(user).deliver
    user.two_week = true
    user.save!
    redirect_to "/admin", :notice => "An email has been successfully sent to #{user.email}."
  end
  
  def forget_two_week
    user = Admin.find_chaps(User.all.where('two_week = ? OR two_week = ?', false, 'false'))
    user.two_week = true
    user.save!
    redirect_to "/admin", :alert => "A two week email will never be sent to #{user.email}."
  end

  def home
    @perc = ((current_user.progress.to_f/Lesson.count)*100).round
    @lessons = Lesson.all
    @possibleAnswers = Response.all.where('user_id = ?', current_user.id)
  end

  def lessons
    @lesson = Lesson.find(params[:id])
  end

  def admin
    require 'date'
    @short_users = User.all.where('created_at > ? AND completed = ?', 6.months.ago, 'false')
    @long_users = User.all.where('created_at < ? AND completed = ?', 6.months.ago, 'false')
    @completed_users = User.all.where(completed: true)
    @banned_users = User.all.where(banhammer: true)
    @newLesson = Lesson.new
    @lessons = Lesson.all.order("created_at DESC")
    @poor = Admin.find_chaps(User.all.where('two_week = ? OR two_week = ?', false, 'false'))
  end
  
  def quiz
    @questions = Question.all.where('quiz_id = ?', params[:id])
    @lesson = Lesson.find(params[:id])
    @possibleAnswers = Response.all.where('user_id = ?', current_user.id)
    @respond = Response.new
    @completed = "true"
    @corr = 0
    
    params[:num] = @questions.count
    for @q in @questions do
      for @ans in Answer.all.where('question_id =?', @q.id) do
        if (@ans.correct == true)
          params["correct#{@q.id}"] = @ans.content
        end
      end
    end
  end
end
