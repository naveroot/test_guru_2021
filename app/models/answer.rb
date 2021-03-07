class Answer < ApplicationRecord
  MAXIMUM_NUMBER_OF_ANSWERS = 4
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_answers_count
    if question.answers.count > MAXIMUM_NUMBER_OF_ANSWERS - 1
      errors.add(:question_id, 'Question must have from 1 for 4 answers!')
    end
  end
end
