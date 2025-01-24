FactoryBot.define do
    factory :topping do
      name { "Olives" }
      quantity { 12 }
      association :category
    end
  end
  