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
end
