require 'action_view'
class Cat < ApplicationRecord
    validates :birth_date, :color, :name, :sex, presence: true 
    validates :color, inclusion: {in: %w(white grey black orange brown)} #message: "%{value} is not a valid color"
    validates :sex, inclusion: {in: %w(M F)} #message: "%{value} is not valid. Must be M or F"
    validate :birth_date_cannot_be_future

    include ActionView::Helpers::DateHelper


    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:birth_date, "Can't be in the future")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end
end
