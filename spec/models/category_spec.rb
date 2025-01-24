require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:pizzas) }
  it { should have_many(:toppings) }
end

# spec/models/crust_spec.rb
require 'rails_helper'

RSpec.describe Crust, type: :model do
  it { should have_many(:orders).dependent(:destroy) }
end
