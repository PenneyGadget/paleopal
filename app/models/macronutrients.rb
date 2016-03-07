class Macronutrients
  def self.collect_macronutrients(parsed_data)
    parsed_data.map do |ingredient|
      { ingredient[:ingredients][0][:text] => {
        fat: ingredient[:totalNutrients][:FAT] ? ingredient[:totalNutrients][:FAT][:quantity] : 0,
        carbs: ingredient[:totalNutrients][:CHOCDF] ? ingredient[:totalNutrients][:CHOCDF][:quantity] : 0,
        protein: ingredient[:totalNutrients][:PROCNT] ? ingredient[:totalNutrients][:PROCNT][:quantity] : 0
        }
      }
    end
  end

  def self.sum_macronutrients(nutrients)
    values = nutrients.map { |hash| hash.values }.flatten
    summed = {}
    summed[:fat] = values.inject(0) { |sum, hash| sum + hash[:fat].floor }
    summed[:carbs] = values.inject(0) { |sum, hash| sum + hash[:carbs].floor }
    summed[:protein] = values.inject(0) { |sum, hash| sum + hash[:protein].floor }
    summed
  end
end
