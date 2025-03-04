# Write your soltuion here!
require "http"
require "json"
require "dotenv/load"
require "ascii_charts"
require "active_support/core_ext/string/inflections"

gkey = ENV.fetch("GMAPS_KEY")
pwkey = ENV.fetch("PIRATE_WEATHER_KEY")

userinput = "chicago heights"

# url sample
googleurl = "https://maps.googleapis.com/maps/api/geocode/json?address=" + userinput.titleize + "&key=" + gkey

ggraw = HTTP.get(googleurl)
ggjson = JSON.parse(ggraw)
s1 = ggjson.fetch("results")
s2 = s1[0].fetch("geometry")
s3 = s2.fetch("location")
lat = s3.fetch("lat")
lng = s3.fetch("lng")

pw_url = "https://api.pirateweather.net/forecast/" + pwkey + "/" + lat.to_s + "," + lng.to_s

pwraw = HTTP.get(pw_url)
pwjson = JSON.parse(pwraw)



pp pw_url
