require 'rails_helper'

RSpec.describe Entry, type: :model do
  it "sums nutrients correctly" do
    nutrients = [{"beef"=>{:fat=>6, :carbs=>1, :protein=>12}},
                 {"doughnut"=>{:fat=>14, :carbs=>20, :protein=>0}}]

    summed = Macronutrients.sum_macronutrients(nutrients)

    expect(summed).to eq({:carbs => 21,
                          :fat => 20,
                          :protein => 12})
  end
end
