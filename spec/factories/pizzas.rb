FactoryBot.define do
    factory :pizza do
      name { "Margherita" }
      quantity { 10 }
      association :category
    end
  end
  