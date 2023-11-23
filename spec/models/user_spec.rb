require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:books).with_foreign_key(:author_id) }
  it { should have_many(:reviews) }
  it { should have_many(:orders).dependent(:destroy) }

  it { should validate_presence_of(:name) }

  describe "callbacks" do
    it "assigns a default role after create" do
      user = create(:user)
      expect(user.has_role?(:user)).to be true
    end
  end

  describe "validate factory" do
    it "has a valid factory do" do
      expect(build(:user)).to be_valid
    end
  end
end
