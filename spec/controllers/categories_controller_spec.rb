require "rails_helper"
RSpec.describe CategoriesController, type: :controller do
  
  let(:admin_user) { create(:user, admin_user: true) }
  let(:category) { create(:category)}

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'render a index' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "return a successful response " do
      get :show
      expect(response).to be_successful
    end
  end
end