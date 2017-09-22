require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "user creation" do
    user = FactoryGirl.create(:user)
    expect(user.email).to eq('my_email')
  end
end
