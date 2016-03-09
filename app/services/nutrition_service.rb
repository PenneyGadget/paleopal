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
    parsed_data = data.map { |ingredient| parse(ingredient) }
    has_error = false
    error_ingredient = ''
    parsed_data.each do |ingredient|
      if !ingredient[:ingredients][0].key?(:parsed)
        has_error = true
        error_ingredient = ingredient[:ingredients][0][:text]
      end
    end
    if has_error
      { :result => "error", :message => "Sorry, '#{error_ingredient}' is not in our database" }
    else
      { :result => "success", :response => Macronutrients.collect_macronutrients(parsed_data) }
    end
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
