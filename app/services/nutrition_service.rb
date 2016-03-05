class NutritionService
  attr_reader :current_user, :connection

  def initialize
    @connection = Faraday.new(:url => "https://api.edamam.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['app_id'] = ENV['EDAMAM_ND_APP_ID']
      faraday.params['app_key'] = ENV['EDAMAM_ND_APP_KEY']
    end
  end

  def get_nutrition_values(meal_data)
    data = meal_data[:ingredients].map do |ingredient|
      connection.get do |request|
        request.url("/api/nutrition-data")
        request.params["ingr"] = ingredient
      end
    end
    if ingredient[:parsed][:foodMatch]
      parsed_data = data.map { |ingredient| parse(ingredient) }
      Macronutrients.collect_macronutrients(parsed_data)
    else
      redirect_to new_entry_path
      #remove unmatched item from the parse_data hash and add it to an error_data
      #hash and display an error -- "Ingredient not found in database" and instruct
      #user how to proceed
    end
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
