class QuestionsController < ApplicationController
    
    def new
        @question = Question.new
    end
    
    def create
        url = request.referrer
        uri = URI::parse(url)
        id = uri.path.split('/')[2]
        @question = Question.new(post_params)
        @question.quiz_id = id
        respond_to do |f|
            if (@question.save)
                f.html { redirect_to "/lessons/#{@question.quiz_id}/edit" }
            else
                f.html { redirect_to "/admin" }
            end
        end
    end
    
    def destroy
    @question = Question.find(params[:id3])
    @question.destroy
    redirect_to "/lessons/#{params[:id]}/edit"
    end
    
    private
    def post_params
        params.require(:question).permit(:quiz_id, :content)
    end
    
end