# frozen_string_literal: true

module User
  module Auth
    extend ActiveSupport::Concern

    included do
      validates :username, :email, presence: true, uniqueness: true
      validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
      validates :password, presence: true, if: :password_digest_blank?
      validates :password, confirmation: true
    end

    def authanticate(password_string)
      digest(password_string) == password_digest ? self : false
    end

    def password=(password_string)
      if password_string.nil?
        self.password_digest = nil
      elsif password_string.present?
        @password = password_string
        self.password_digest = digest(password_string)
      end
    end

    private

    def digest(string)
      Digest::SHA1.hexdigest(string)
    end

    def password_digest_blank?
      password_digest.blank?
    end
  end
end
