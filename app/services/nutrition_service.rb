class NutritionService
  attr_reader :current_user, :connection

  def initialize
    @connection = Faraday.new(:url => "https://api.edamam.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      # faraday.params["app_id"] = EDAMAM_RA_APP_ID
      # faraday.params["app_key"] = EDAMAM_RA_APP_KEY
      faraday.params["app_id"] = "bc722b16"
      faraday.params["app_key"] = "ae7718a5c8249d62b33036a3ae66c1a0"
    end
  end

  def get_nutrition_values(gold)
    @connection.post do |request|
      request.url("/api/nutrition-details")
      request.headers["Content-Type"] = "application/json"
      request.body = gold.to_json
    end
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
