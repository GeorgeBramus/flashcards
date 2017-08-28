class Card < ApplicationRecord
  require "date"

  validates :original_text, :translated_text, presence: true
  validate :coincidence, on: [ :create, :update ]

  before_save :date_change, on: [ :create, :update ]

  private
    def date_change
      self.review_date = Date.today + 3
    end

    def coincidence
      if self.original_text.to_s.downcase.intern == self.translated_text.to_s.downcase.intern
        errors.add(:card, "The original text should be different from the translated text")
        # errors.add(:original_text, "The original text should be different from the translated text")
        # errors.add(:translated_text, "The original text should be different from the translated text")
      end
    end
end

