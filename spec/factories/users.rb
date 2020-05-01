FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { "test-user@test.local" }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }

    factory :google_user do |user|
      user.nickname  {"mockuser"}
      user.email  {"google@test.com"}
    end
  end
end
