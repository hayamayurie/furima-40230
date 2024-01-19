FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "g9" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    family_name           { person.family.kanji }
    read_first            { person.first.katakana }
    read_family           { person.family.katakana }
    birth                 { Faker::Date.backward }
  end
end

require 'faker'
require 'gimei'