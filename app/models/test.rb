class Test < ApplicationRecord
    has_many :test_passages
    has_many :tests, through: :test_passages
    has_many :questions
    belongs_to :category, optional: true
    belongs_to :author, class_name: 'User'

    def self.titles_by_category(category)
        joins('JOIN categories ON categories.id = tests.categories_id')
        .where(categories: { title: category})
        .order(title: :desc)
        .pluck(:title)
    end
end
