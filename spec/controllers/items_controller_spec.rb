require 'rails_helper'

describe ItemsController do
  before do
    login create(:user)
  end
  describe 'GET #index' do
    it "indexアクションが動いた時にindex.html.hamlにページが移動したか" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #new' do
    it 'newアクションが動いた時にnewにページが移動したか' do
      get :new
      expect(response).to render_template :new
    end
  end
end
