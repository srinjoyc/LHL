class Book < ActiveRecord::Base
    belongs_to :library

    validates :title,
     presence:true,  
     length: { maximum: 500}

    validates :author,
               presence: true,
               length: { maximum: 100, minimum: 5 }

    validates :pages,
              presence: true,
              numericality: {only_integer: true, :greater_than_or_equal_to => 4}

    validate :isbn_check 

    def available?
        library.lends.count > 0
    end 

    def isbn_check
        isbn =~ /^\d{9}-(\d|X)/
    end 
end
