class PagesController < ApplicationController
  def index
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
    @users = User.all
    @newLesson = Lesson.new
    @lessons = Lesson.all.order("created_at DESC")
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
