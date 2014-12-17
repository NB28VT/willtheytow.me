require 'open-uri'
require 'nokogiri'
require 'pry'
require 'httparty'

# uri = open("http://alerts.weather.gov/cap/us.php?x=1")

uri = HTTParty.get("http://alerts.weather.gov/cap/us.php?x=1")

entries = uri["feed"]["entry"].each do |alert|
  if alert["event"].include?("Winter Storm Warning")
    puts "Winter storm warning in effect."
    puts alert["areaDesc"]
  end
end
