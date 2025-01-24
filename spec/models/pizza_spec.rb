require 'rails_helper'

RSpec.describe Pizza, type: :model do
  it { should belong_to(:category) }
  it { should have_many(:orders).dependent(:destroy) }
end
