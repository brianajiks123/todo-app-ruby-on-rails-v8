class Project < ApplicationRecord
    has_many :todos, dependent: :destroy
    validates :name, presence: { message: "can't be blank!" }
end
