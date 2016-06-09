# Method of allowing the user to share his/her location and get a carousel of the nearest venues
def choose_location(session, sender)
  p "CHOOSE LOCATION"
  context = session.context
  geo_loc = "http://api.songkick.com/api/3.0/search/locations.json?location=geo:#{context['lat']},#{context['lng']}&apikey=h76Z5PDgOid28Zly"
  p geo_loc
  locations =  Oj.load(RestClient.get geo_loc, :content_type => :json, :accept => :json)["resultsPage"]["results"]["location"][0..10]

  structured_reply = ButtonTemplate.new
  structured_reply.set_text("Please choose a location")
  locations.each do |loc|

  end
  structured_reply.add_postback(locations[0]["city"]["displayName"], locations[0]["city"]["displayName"].downcase)
  structured_reply.add_postback(locations[0]["city"]["displayName"], locations[1]["city"]["displayName"].downcase)
  structured_reply.add_postback(locations[0]["city"]["displayName"], locations[2]["city"]["displayName"].downcase)
  reply_transfer(session, sender, structured_reply)
end


def show_venues(session, sender, lat = "0", lng = "0" )
  context = session.context
  structured_reply = GenericTemplate.new
  if lat == "0"
    venue_url = "http://api.songkick.com/api/3.0/search/venues.json?query=#{context['city']}&apikey=h76Z5PDgOid28Zly"
  else
    venue_url = "http://api.songkick.com/api/3.0/search/venues.json?location=geo:#{context['lat']},#{context['lng']}&apikey=h76Z5PDgOid28Zly"
  end
  response =  Oj.load(RestClient.get venue_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["venue"][0..9]
  response.each do |venue|
    button = Button.new
    button.add_postback("See concerts", venue['id'])
    structured_reply.add_element( venue["displayName"], "", "http://images.sk-static.com/images/media/profile_images/venues/8086/col2", "", [button.get_message])
    venue["displayName"]
  end
  sender.reply(structured_reply.get_message)
  #reply_transfer(session, sender, structured_reply)
end

