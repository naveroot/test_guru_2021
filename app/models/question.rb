class Question < ApplicationRecord
    MAXIMUM_NUMBER_OF_ANSWERS = 4
    
    belongs_to :test
    has_many :answers

    validates :body, presence: true
end
