require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:order_items).dependent(:destroy) }
  it { should belong_to(:pizza) }
  it { should belong_to(:crust) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:size) }

  it { should define_enum_for(:status).with_values([:pending, :ordered, :deliverd]) }
end
