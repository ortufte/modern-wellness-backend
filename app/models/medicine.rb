class Medicine < ApplicationRecord
    belongs_to :user

    validates :name, :dosage,  presence: true
end
