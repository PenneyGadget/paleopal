require 'rails_helper'

RSpec.describe Entry, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:date) }

  it { should validate_presence_of(:meal) }
  
  it { should validate_presence_of(:ingredients) }
end
