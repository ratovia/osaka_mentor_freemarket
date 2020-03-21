FactoryBot.define do
  factory :image do
    src { File.open("#{Rails.root}/spec/fixtures/test_image.jpg") }
  end
end
