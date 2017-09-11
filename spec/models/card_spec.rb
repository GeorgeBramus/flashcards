require "rails_helper"

RSpec.describe Card, :type => :model do
  describe "change when creating" do
    it "field review_date" do
      card = FactoryGirl.build(:card)
      card.review_date = 3.days.since
    end
  end
end
