class User < ApplicationRecord
    has_many :test_passages
    has_many :tests, through: :test_passages
    has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

    validates :username, :email, presence: true, uniqueness: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    def tests_with_level(level)
        tests.where(level: level)
    end
end
