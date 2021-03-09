# frozen_string_literal: true

class AddFieldsToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_passages, :current_question, refereces: :questions
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
