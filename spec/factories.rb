FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { '12345678' }
  end

  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    genre { Faker::Book.genre }
  end

  factory :review do
    book { create(:book) }
    note { '5' }
    comment { 'Muito interessante' }
  end
end