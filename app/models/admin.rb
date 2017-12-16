class Admin < ActiveRecord::Base
    
    def self.find_chaps(poss)
        require 'date'
        @poor_chap = nil
            for @u in poss do
                if (((Date.today - (Time.at(@u.created_at)).to_date).to_i) > 13)
                    @poor_chap = @u
                end
            end
        
        return @poor_chap
    end
end