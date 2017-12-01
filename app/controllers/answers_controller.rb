class AnswersController < ApplicationController
    
    def new
        @answer = Answer.new
    end
    
    def check
        puts "//////// //////// /////// #{@id3}"
        puts "//////// //////// /////// #{@corr}"
    end
    
    def create
        @answer = Answer.new(post_params)
        respond_to do |f|
            if (@answer.save)
                if (@answer.correct == true)
                    @q = Question.find(@answer.question_id)
                    @q.correct = @answer.content
                    @q.save
                end
                f.html { redirect_to "/lessons/#{@answer.lesson}/edit" }
            else
                f.html { redirect_to "/admin" }
            end
        end
    end
    
    def destroy
    @answer = Answer.find(params[:id3])
    @answer.destroy
    redirect_to "/lessons/#{params[:id]}/edit"
    end
    
    private
    def post_params
        params.require(:answer).permit(:question_id, :content, :lesson, :correct)
    end
    
end