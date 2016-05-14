class AddAnnualSalary < ActiveRecord
    def change 
        add_column :employees, :annual_salary, :integer 
    end 
end 