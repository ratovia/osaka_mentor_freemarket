FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }

    # trait :google_user do
    #   nickname { "mockuser" }
    #   email { "google@test.com" }
    # end
    # trait :google_user do
    #   after(:build) do |user|
    #     user.nickname = "mockuser" 
    #     user.email = "google@test.com"
    #   end
    # end
    factory :google_user do |user|
      user.nickname  {"mockuser"}
      user.email  {"google@test.com"}
    end
  end
end
