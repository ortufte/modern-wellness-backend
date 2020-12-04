class Log < ApplicationRecord
    belongs_to :user

    validates :date,  presence: true
    validates :symptom_level, numericality: { only_integer: true, less_than_or_equal_to: 10 }

    
end
