class Deck < ApplicationRecord
  has_many :cards
  attr_accessor :default_deck

  validates :name, presence: true
end
