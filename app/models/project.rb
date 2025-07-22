class Project < ApplicationRecord
    validates :name, presence: { message: "can't be blank!" }
end
