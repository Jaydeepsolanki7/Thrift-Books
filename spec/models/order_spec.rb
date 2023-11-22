require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:user) { create(:user) }

  it "should be valid only is user is present " do
    order = build(:order, user: user)
    expect(order).to be_valid
  end
  
  it { should have_many(:book_orders) }
  it { should have_many(:books).through(:book_orders) }
  
end
