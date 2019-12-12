require "rails_helper"
describe "item_images", type: :system do
  before :each do
    user = User.create(email: 'user@example.com', password: 'password', nickname: "テストユーザ")
    sign_in user
  end

  it "投稿画面にいける" do
    visit new_item_path
    expect(page).to have_content '商品の情報を入力'
  end

  it "画像を投稿するとプレビューが表示される" do
    visit new_item_path
    page.attach_file('upload_file', 'public/test/images/test_image.jpg', make_visible: true)
    expect(page).to have_selector '.select_image', count: 1
  end
end
