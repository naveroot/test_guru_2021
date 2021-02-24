class Answer < ApplicationRecord
    belongs_to :question

    validates :body, presence: true
    validate :validate_answers_count

    scope :correct, -> { where(correct: true) }

    def validate_answers_count
        if question.answers.count > Question::MAXIMUM_NUMBER_OF_ANSWERS - 1
            errors.add(:question_id, 'Question must have from 1 for 4 answers!')
        end
    end
end