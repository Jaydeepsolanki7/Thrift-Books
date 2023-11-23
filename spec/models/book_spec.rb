require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:author) { create(:user) }
  let(:category) { create(:category) }

  it { should belong_to(:author).class_name("User") }
  it { should belong_to(:category) }
  it { should have_many(:book_orders) }
  it { should have_many(:reviews) }
  it { should have_many(:orders).through(:book_orders) }
  it { should have_one_attached(:cover_image) }
  it { should have_many_attached(:pages) }

  
  it "is not valid without an author" do
    book = build(:book, author: nil, category: category)
    expect(book).not_to be_valid
  end

  it "is not valid without a category" do
    book = build(:book, author: author, category: nil)
    debugger
    expect(book).not_to be_valid
  end

  it "is not valid without a category" do
    book = build(:book, author: author, category: nil)
    expect(book).not_to be_valid
  end

  it "is not valid without a category" do
    book = build(:book, author: author, category: nil)
    expect(book).not_to be_valid
  end

  it "is not valid without a category" do
    book = build(:book, author: author, category: nil)
    expect(book).not_to be_valid
  end
  
  it "should validate when title is present " do
    book = build(:book, author: author, category: category)
    expect(book).to be_valid
  end

  # it "is valid with valid attributes" do
  #   book = build(:book, author: author, category: category)
  #   expect(book).to be_valid
  # end
end
