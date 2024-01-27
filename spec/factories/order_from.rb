FactoryBot.define do
  factory :order_from do
    postal_code     { '374-9876' }
    prefecture_id   { 0 }
    city            { '市名' }
    street          { '番地' }
    building_name   { '建物名' }
    phone_number    { '10492930293' }
    token           { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
