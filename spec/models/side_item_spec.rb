require 'rails_helper'

RSpec.describe SideItem, type: :model do
    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_many(:order_items).class_name('OrderItem') }    
end
