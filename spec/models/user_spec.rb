require 'rails_helper'

RSpec.describe User, type: :model do

  context "validate factory" do
    it "has a valid factory do" do
      expect(build(:user)).to be_valid
    end
  end

  context "validation" do
    before { create(:user) }

    context "presence" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :email }
      it { should validate_presence_of :encrypted_password }
    end
  end

  context "uniqueness" do
    it { should validate_uniqueness_of :email }
  end
end
