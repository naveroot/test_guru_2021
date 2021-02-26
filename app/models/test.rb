class Test < ApplicationRecord
    has_many :test_passages
    has_many :tests, through: :test_passages
    has_many :questions
    belongs_to :category, optional: true
    belongs_to :author, class_name: 'User'

    scope :easy, -> { where(level: 0..1) }
    scope :medium, -> { where(level: 2..4) }
    scope :hard, -> { where(level: 5..Float::INFINITY) }
    scope :by_category, ->(category) { joins(:category).where(categories: { title: category }) }

    validates :title, presence: true, uniqueness: { scope: :level }
    validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    def self.titles_by_category(category)
        by_category(category).pluck(:title)
    end
end
