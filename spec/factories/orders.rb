FactoryBot.define do
    factory :order do
      association :user, factory: :customer
      association :pizza
      association :crust
      quantity { 1 }
      size { "medium" }
      status { "pending" }
  
      trait :ordered do
        status { "ordered" }
      end
  
      trait :delivered do
        status { "delivered" }
      end
    end
  end
  