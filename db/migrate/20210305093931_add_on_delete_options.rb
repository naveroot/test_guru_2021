# frozen_string_literal: true

class AddOnDeleteOptions < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :answers, :questions
    remove_foreign_key :test_passages, :tests
    add_foreign_key :answers, :questions, on_delete: :cascade
    add_foreign_key :test_passages, :tests, on_delete: :cascade
  end
end
