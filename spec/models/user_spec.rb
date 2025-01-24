require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(email: "test@example.com", password: "password", role: :customer) }

  it { should have_many(:orders).dependent(:destroy) }

  it { should define_enum_for(:role).with_values([:customer, :vendor]) }

  it "validates the role enum" do
    expect(user).to be_valid
    user.role = 'vendor'
    expect(user).to be_valid
  end
end
