require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    it "indexアクションが動いた時にindex.html.hamlにページが移動したか" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #index' do
    it "出品したidが降順に並び変えられているか" do
      items = create_list(:item, 4)
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.id <=> a.id })
    end
  end
end
