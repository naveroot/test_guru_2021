class Test < ApplicationRecord
    def self.titles_by_category(category)
        joins('JOIN categories ON categories.id = tests.categories_id')
        .where(categories: { title: category})
        .order(title: :desc)
        .pluck(:title)
    end
end
