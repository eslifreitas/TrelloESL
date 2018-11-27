class Person < ApplicationRecord
    has_many :projects 

    validates :name, :email, :role, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}
end

