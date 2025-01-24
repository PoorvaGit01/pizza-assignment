require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should belong_to(:orderable) }
  it { should belong_to(:order) }
end
