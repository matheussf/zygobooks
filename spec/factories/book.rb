# This will guess the User class
FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description  { FFaker::Book.description }
    image_url  { FFaker::Book.orly_cover }
  end
end
