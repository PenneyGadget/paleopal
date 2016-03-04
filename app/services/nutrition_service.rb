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
    data = meal_data[:ingredients].map do |i|
      connection.get do |request|
        request.url("/api/nutrition-data")
        request.params["ingr"] = i
      end
    end
    parsed_data = data.map { |i| parse(i) }
    Macronutrients.collect_macronutrients(parsed_data)
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
