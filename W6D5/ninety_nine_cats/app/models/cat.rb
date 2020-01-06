require 'date'
COLORS = ['white','brown','orange','black','gray']
class Cat < ApplicationRecord
    validates :birth_date,      presence: true
    validates :color,           presence: true, inclusion: COLORS
    validates :name,            presence: true
    validates :sex,             presence: true
    # validates :description,     presence: true
    
    def age
        birth_day = self[:birth_date]
        (Date.today - birth_day).to_i / 365
    end
end