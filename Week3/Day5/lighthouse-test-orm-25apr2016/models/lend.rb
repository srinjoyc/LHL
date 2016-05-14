class Lend < ActiveRecord::Base
    has_one :library, through: :book 
    belongs_to :book 
    validate :check_dates 
    after_create :update_revenue, if: :overdue?

    def overdue?
        if checkin
            checkin > due 
        else
            Date.today > due
        end 
    end 

    def fees
        if checkin && overdue?
            late_days = checkin - due 
        else  
            late_days = Date.today - due
        end  
        late_days * library.late_fee  
    end 

    private 

        def check_dates
            if checkin && !checkout 
                due > checkin
            end 
            if checkout && !checkin 
                due > checkout
            end 
            if checkin && checkout 
                checkin > checkout 
            end  
        end 

        def update_revenue 
            library.revenue = fees 
            library.save 
        end 

end
