require 'json'
require 'httparty'
require 'pry'
require 'dotenv'

#
# Dotenv.load
# api_key = ENV["WU_API_KEY"]

def get_alerts(state, city)
  Dotenv.load
  api_key = ENV["WU_API_KEY"]

  city_call = HTTParty.get("http://api.wunderground.com/api/#{api_key}/alerts/q/#{state}/#{city}.json
  ")

  city_call["alerts"].each do |alert|
    if alert["type"] == "WIN"
      print "Snow alert present"
    else
      print "No snow alert present"
    end
  end
end




get_alerts("MA","Boston")
sleep 6
get_alerts("VT", "Hinesburg")
sleep 6
get_alerts("VA", "Richmond")
sleep 6
get_alerts("OR", "Portland")
