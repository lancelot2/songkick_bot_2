# Method of allowing the user to share his/her location and get a carousel of the nearest venues
def choose_location
  geo_loc = "http://api.songkick.com/api/3.0/search/locations.json?location=geo:#{context['lat']},#{context['lng']}&apikey=h76Z5PDgOid28Zly"
  p geo_loc
  locations =  Oj.load(RestClient.get geo_loc, :content_type => :json, :accept => :json)["resultsPage"]["results"]["location"][0..2]

  structured_reply = ButtonTemplate.new
  structured_reply.set_text("Please choose a location")
  structured_reply.add_postback(locations[0]["city"]["displayName"], locations[0]["city"]["displayName"].downcase)
  structured_reply.add_postback(locations[0]["city"]["displayName"], locations[1]["city"]["displayName"].downcase)
  structured_reply.add_postback(locations[0]["city"]["displayName"], locations[2]["city"]["displayName"].downcase)
  reply_transfer(session, sender, structured_reply)
end
