require "rails_helper"
RSpec.describe CategoriesController, type: :controller do
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

  describe 'GET #new' do
    it 'it returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end
end