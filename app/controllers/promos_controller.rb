class PromosController < ApplicationController
    
    def new
        @promo = Promo.new
    end
    
    def edit
        @promo = Promo.find(params[:id])
        @questions = Question.all.where('quiz_id = ?', params[:id])
        @newQuestion = Question.new
        @newAnswer = Answer.new
    end
    
    def update
        @promo = Promo.find(params[:id])
        
        if @promo.update_attributes(params[:promo].permit(:maximum, :code, :used))
            redirect_to '/admin'
        end
    end
    
    def create
        @promo = Promo.new(post_params)
        respond_to do |f|
            if (@promo.save)
                f.html { redirect_to "/admin" }
            else
                f.html { redirect_to "/admin" }
            end
        end
    end
    
    def destroy
    @promo = Promo.find(params[:id])
    @promo.destroy
    redirect_to '/admin'
    end
    
    private
    def post_params
        params.require(:promo).permit(:maximum, :code)
    end
    
end