class NutritionService
  attr_reader :current_user, :connection

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new(:url => "https://api.edamam.com/api/nutrition-details") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["app_id"] = EDAMAM_RA_APP_ID
      faraday.params["app_key"] = EDAMAM_RA_APP_KEY
    end
  end

end

# ## POST ##
#
# conn.post '/nigiri', { :name => 'Maguro' }  # POST "name=maguro" to http://sushi.com/nigiri
#
# # post payload as JSON instead of "www-form-urlencoded" encoding:
# conn.post do |req|
#   req.url '/nigiri'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "name": "Unagi" }'
# end
