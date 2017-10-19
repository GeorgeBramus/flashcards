class Deck < ApplicationRecord
  attr_accessor :default_deck
  has_many :cards
  belongs_to :user

  validates :name, presence: true
end
