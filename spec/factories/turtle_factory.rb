FactoryBot.define do
  factory :turtle do
    name { Faker::OnePiece.character }
    color { %w(blue green pink yellow).sample }
    email { Faker::Internet.email }
  end
end
