require 'rails_helper'

RSpec.describe Category, type: :model do

  it { should have_many(:books) }
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  let(:category) { create(:category) }

  describe 'validation tests' do
    it 'validates presence of name' do
      expect(category).to validate_presence_of(:name)
    end
  end
end
