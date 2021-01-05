# This will guess the User class
FactoryBot.define do
  factory :user do
    name { FFaker::Internet.name }
    email  { FFaker::Internet.email }
    password  { FFaker::Internet.password }
    role { 1 }
  end

  factory :admin_user, :parent => :user do
    role { 0 }
  end
end
