require "rails_helper"
RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::ControllerHelpers

  
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
      get :show, params: { id: category.id }
      expect(response).to be_successful
    end

    it "assign category to @category" do
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    # it "assigns books of the requested category to @books" do
    #   author = create(:user)
    #   book = create(:book, category: category, author: author)
    #   get :show, params: { id: category.id }
    #   expect(assigns(:books)).to eq([book])
    # end
  end


  describe "GET #new" do
    # it "returns a successful response for admin user" do
    #   sign_in admin_user
    #   get :new
    #   expect(response).to be_successful
    # end

    it "redirects to login-page(new_user_session_path) for non-admin user" do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
