class Card < ApplicationRecord
  mount_uploader :image, ImageForCardUploader
  belongs_to :user
  belongs_to :deck, optional: true

  validates :original_text, :translated_text, presence: true
  validate :coincidence, on: [ :create, :update ]

  # before_create :date_change, on: [ :create ]

  # private def date_change
  #   self.review_date = 3.days.since
  # end

  private def coincidence
    if self.original_text.to_s.downcase.intern == self.translated_text.to_s.downcase.intern
      errors.add(:base, "The original text should be different from the translated text")
    end
  end
end
