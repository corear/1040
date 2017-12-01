class LessonsController < ApplicationController
    
    def new
        @lesson = Lesson.new
    end
    
    def edit
        @lesson = Lesson.find(params[:id])
        @questions = Question.all.where('quiz_id = ?', params[:id])
        @newQuestion = Question.new
        @newAnswer = Answer.new
    end
    
    def update
        @lesson = Lesson.find(params[:id])
        
        if @lesson.update_attributes(params[:lesson].permit(:title, :description, :video, :order, :cover))
            redirect_to '/admin'
        end
    end
    
    def create
        @lesson = Lesson.new(post_params)
        respond_to do |f|
            if (@lesson.save)
                @quiz = Quiz.create!({:ref => "#{@lesson.id}"})
                f.html { redirect_to "/admin" }
            else
                f.html { redirect_to "/admin" }
            end
        end
    end
    
    def destroy
    @lesson = Lesson.find(params[:id])
    Question.delete_all "quiz_id = #{params[:id]}"
    @lesson.destroy
    redirect_to '/admin'
    end
    
    private
    def post_params
        params.require(:lesson).permit(:title, :description, :video, :order, :cover)
    end
    
end