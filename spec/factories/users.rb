FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}

    trait :google_user do
      nickname {"mockuser"}
      email {"sample@test.com"}
    end
  end
end
