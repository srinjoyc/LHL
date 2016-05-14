class Store < ActiveRecord::Base
    has_many :employees 
    validates_length_of :name,
     :minimum => 1, 
     :maximum => 25,
     :too_short => "can't be blank"
    validates :annual_revenue, 
        :numericality => {:greater_than_or_equal_to => 0}
    validates :male_employees, 
        :numericality => {:greater_than_or_equal_to => 0}
    validates :female_employees, 
        :numericality => {:greater_than_or_equal_to => 0}

    def annual_expense
        self.employees.inject(0) do |sum,worker|
           sum += worker.annual_salary  
        end 
    end

    def annual_profit 
        self.annual_revenue - self.annual_expense
    end  
end
