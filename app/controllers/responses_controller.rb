class ResponsesController < ApplicationController
    
    def new
        @respond = Response.new
    end
    
    def create
        @respond = Response.new(post_params)
        respond_to do |f|
            if (@respond.save)
                f.html { redirect_to "/quiz/#{Question.find(@respond.question_id).quiz_id}" }
            else
            end
        end
    end
    
    private
    def post_params
        params.require(:response).permit(:question_id, :content, :user_id)
    end
    
end