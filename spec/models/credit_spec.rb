require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe 'valid' do
    it "creditはtokenがあったら保存できること" do
      credit = create(:credit)
      expect(credit).to be_valid
    end
  end
end