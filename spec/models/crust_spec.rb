require 'rails_helper'

RSpec.describe Crust, type: :model do
  it { should have_many(:orders).dependent(:destroy) }
end
