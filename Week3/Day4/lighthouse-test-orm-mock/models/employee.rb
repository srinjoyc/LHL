class Employee < ActiveRecord::Base
    belongs_to :store 
    validates :first_name, :presence => true
    validates :last_name, :presence => true 
    after_create :increment_employees#, on: [:create, :update, :destroy]

    def annual_salary
        hourly_rate * 1950
    end 
    
    def self.average_hourly_rate_for(gender)
      case 
        when gender == 'M'
          self.where(gender: 'M').average('hourly_rate').round(2)
        when gender == 'F'
          self.where(gender: 'F').average('hourly_rate').round(2)
        else 
          self.average('hourly_rate').round(2)
      end 
    end 

    private
        def increment_employees
          case gender
            when 'm', 'M'
                store.male_employees += 1
                store.save 
            when 'f', 'F'
                store.female_employees += 1
                store.save  
        end 
    end


end 
