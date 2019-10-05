FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "fakeemail#{n}@emails.com"
    end
    password {"words1432"}
    password_confirmation {"words1432"}
  end
end