class Macronutrients
  def self.collect_macronutrients(parsed_data)
    parsed_data.map do |ingredient|
      { ingredient[:ingredients][0][:text] => {
        fat: ingredient[:totalNutrients][:FAT][:quantity],
        carbs: ingredient[:totalNutrients][:CHOCDF][:quantity],
        protein: ingredient[:totalNutrients][:PROCNT][:quantity]
        }
      }
    end
  end

  def self.sum_macronutrients(nutrients)
    values = nutrients.map { |hash| hash.values }.flatten
    summed = {}
    summed[:fat] = values.inject(0) { |sum, hash| sum + hash[:fat] }
    summed[:carbs] = values.inject(0) { |sum, hash| sum + hash[:carbs] }
    summed[:protein] = values.inject(0) { |sum, hash| sum + hash[:protein] }
    summed
  end
end
