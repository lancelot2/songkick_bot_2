def city(session, sender, msg)
  context = session.context
  area_url = "http://api.songkick.com/api/3.0/search/locations.json?query=#{context['city']}&apikey=h76Z5PDgOid28Zly"
  area_response  =  Oj.load(RestClient.get area_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["location"].first["metroArea"]["id"]
  concert_url = "http://api.songkick.com/api/3.0/metro_areas/#{area_response}/calendar.json?apikey=h76Z5PDgOid28Zly"
  concerts =  Oj.load(RestClient.get concert_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"]
  generic_template_message(session, concerts, sender, context, msg)
  # concerts.each do |c|
  #   p c["performance"].first["artist"]["uri"]
  #   p c["displayName"]
  #   p c["venue"]["displayName"]
  #   a = Mechanize.new { |agent|
  #     agent.user_agent_alias = 'Mac Safari'
  #   }
  #   a.get(c["performance"].first["artist"]["uri"]) do |page|
  #     ap "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
  #   end
  # end
end
