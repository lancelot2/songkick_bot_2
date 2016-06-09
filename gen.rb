require 'open-uri'
require 'net/https'
require 'json'
require 'rest-client'
require 'awesome_print'
require 'oj'
require 'mechanize'
require "geocoder"


# # button = ReceiptTemplate.new("Matthias", "122346", "USD", "paypal", Time.now.to_i)
# # button.add_element('Tshirt','top', "1", "10", "USD", 'https://s-media-cache-ak0.pinimg.com/736x/04/03/27/040327e01ef3f42a1eae9c4b2d1c299f.jpg')
# # button.set_address("13 allée", "", "Paris", "75011", "IDF", "FRancse")
# # button.set_summary(10, 10, 10, 100)

# # p button.get_message

# #   token = "CAAKs4sjMLtgBACbNSA3adhDT76dxu4A2iqNsZBcsfPgCMeVBZCbB7yGI5SiPU6PbfpFyi2W7zEclj8YXYxCG9VLcWZCBVT4XsBBEFJt6tAH8XYu1Y0W6BJsT2L6YNSvHnYV6pAgIaZB7HWrzchURHT0eSdyFB8OKR0wkkhjg0yatEx3XBIZAedcSRZAFXuSHIZD"
# #   url = "https://graph.facebook.com/v2.6/me/messages?"
# #   request_params =  {
# #     recipient: {id: 1006889982732663},
# #     "message": button.get_message,

# #     access_token: token
# #   }
# #   RestClient.post url, request_params.to_json, :content_type => :json, :accept => :json
#  # msg = 'USA'
#  # context = {}
#  # countries = [["US", "USA", "States", "America", "United States"], ["UK", "Great Britain", "United Kingdom", "England", "Scotland"], ["Europe", "France", "Germany", "Holland", "Danemark", "Sweden", "Spain", "Ireland", "Italy", "Hungary"]]
#  #  usa_cities = [["San Francisco", "SF"], ["Los Angeles", "LA"], ["New York", "New-York", "NY", "NYC"], ["Portland"], ["Washington"], ["Philadelphia"], ["Seattle"], ["Chicago"], ["Orlando"], ["Pittsburg"]]
#  #  uk_cities = [["London", "ldn"], ["Manchester"], ["Glasgow"], ["Edinburgh"], ["Birmingham"], ["Newcastle"], ["Bristol"], ["Belfast"], ["Brighton"], ["Liverpool"]]
#  #  european_cities = [["Paris", "Pari"], ["Berlin"], ["Amsterdam"], ["Barcelona"], ["Copenhagen"], ["Stockholm"], ["Dublin"], ["Prague"], ["Rome"], ["Budapest"]]
#  #  keywords = countries + usa_cities + uk_cities + european_cities
#  #  p keywords
#  #  p 'ENTITIES DETERMINATION'

# # ​
#SEARCH FOR EVENTS BY VENUES
# concert_url = "http://api.songkick.com/api/3.0/venues/6239/calendar.json?apikey=h76Z5PDgOid28Zly"
# response =  Oj.load(RestClient.get concert_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"]
# response.each do |c|

# end
# # ​
# # ​
# # ​
# # ​
# # ​
# # #SEARCH FOR ARTISTS_ID BASED ON HIS/HER NAME
# # artist_url = "http://api.songkick.com/api/3.0/search/artists.json?query=JuliannaBarwick&apikey=h76Z5PDgOid28Zly"
# # response =  Oj.load(RestClient.get artist_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["artist"][0]
# # # p response
# # # response.each do |c|
# # #   p c["id"]
# # # end
# # ​
# # ​
# # ​
# # ​
# # ​
# # ​
#SEARCH FOR VENUES BY NAME
# venue_url = "http://api.songkick.com/api/3.0/search/venues.json?query=london&apikey=h76Z5PDgOid28Zly"
# response =  Oj.load(RestClient.get venue_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["venue"][0..9]
# response.each do |venue|
#   ap venue["displayName"]
#   ap venue['id']
# end
# # ​
# # ​
# # ​
# # ​
# # ​
# # ​
# # #SEARCH FOR VENUES BY GPS COORDINATES
venue_url = "http://api.songkick.com/api/3.0/search/venues.json?location=geo:{51.49209, -0.10567}&apikey={h76Z5PDgOid28Zly}"
response =  Oj.load(RestClient.get venue_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["venue"][1..30]
p response

#  area_url = "http://api.songkick.com/api/3.0/search/locations.json?query=san francisco&apikey=h76Z5PDgOid28Zly"
#  area_response  =  Oj.load(RestClient.get area_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["location"]
#  lat = "51.5078"
#  lng = "-0.128"
#  geo_loc = "http://api.songkick.com/api/3.0/search/locations.json?location=geo:51.5078,-0.128&apikey=h76Z5PDgOid28Zly"
#   geo_loc
#  response =  Oj.load(RestClient.get geo_loc, :content_type => :json, :accept => :json)["resultsPage"]["results"]["location"][0..2]
#  response.each do |r|
#     r["city"]["displayName"]
#  end


# concert_url = "http://api.songkick.com/api/3.0/metro_areas/24426/calendar.json?apikey=h76Z5PDgOid28Zly"
# concerts =  Oj.load(RestClient.get concert_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"][1..15]


# concert_url = "http://api.songkick.com/api/3.0/metro_areas/24426/calendar.json?apikey=h76Z5PDgOid28Zly"
# concerts =  Oj.load(RestClient.get concert_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"][1..5]

# concerts.each do |c|
#   # p c["performance"].first["artist"]["uri"]
#   # p c["displayName"]
#   # p c["venue"]["displayName"]
#   p c["start"]["datetime"].class
#   p DateTime.parse(c["start"]["datetime"]).class
#   p DateTime.parse(c["start"]["datetime"]).strftime("%B %d at %l:%M%P")
#   # p c["start"]["datetime"].strptime("%B%d at %l:%M%p")
#   a = Mechanize.new { |agent|
#     agent.user_agent_alias = 'Mac Safari'
#   }
#   a.get(c["performance"].first["artist"]["uri"]) do |page|
#     ap "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
#   end
# end
# concert_url = "http://api.songkick.com/api/3.0/metro_areas/#{area_response}/calendar.json?apikey=h76Z5PDgOid28Zly"
# p concerts =  Oj.load(RestClient.get concert_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"].count

# concerts.each do |c|
#   # p c["performance"].first["artist"]["uri"]
#   # p c["displayName"]
#   # p c["venue"]["displayName"]
#    p c["start"]["datetime"].class
#    #DateTime.parse(c["start"]["datetime"]).class
#   # DateTime.parse(c["start"]["datetime"]).strftime("%B %d at %l:%M%P")
#   # p c["start"]["datetime"].strptime("%B%d at %l:%M%p")
#   a = Mechanize.new { |agent|
#     agent.user_agent_alias = 'Mac Safari'
#   }
#   a.get(c["performance"].first["artist"]["uri"]) do |page|
#     ap "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
#   end
# end


# # artist_url = "http://api.songkick.com/api/3.0/search/artists.json?query=Rich Stephenson&apikey=h76Z5PDgOid28Zly"
# # response =  Oj.load(RestClient.get artist_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["artist"][0]["uri"]
# # response
#  #h76Z5PDgOid28Zly

#  a = Mechanize.new { |agent|
#   agent.user_agent_alias = 'Mac Safari'
# }

# a.get("http://www.songkick.com/leaderboards/popular_artists") do |page|
#   ap page.search(".name")[20..30].children
# end




# ##################################################################

#  # country = [["usa", "us", "states", "america", "united states"], ["uk", "great britain", "united kingdom", "england", "scotland"], ["europe", "france", "germany", "holland", "danemark", "sweden", "spain", "ireland", "italy", "hungary"]]
#  #  usa_cities = [["sf", "san francisco"], ["los angeles", "la"], ["new york", "new-york", "ny", "nyc"], ["portland"], ["washington"], ["philadelphia"], ["seattle"], ["chicago"], ["orlando"], ["pittsburg"]]
#  #  uk_cities = [["london", "ldn"], ["manchester"], ["glasgow"], ["edinburgh"], ["birmingham"], ["newcastle"], ["bristol"], ["belfast"], ["brighton"], ["liverpool"]]
#  #  european_cities = [["paris", "pari"], ["berlin"], ["amsterdam"], ["barcelona"], ["copenhagen"], ["stockholm"], ["dublin"], ["prague"], ["rome"], ["budapest"]]
#  #  city = usa_cities + uk_cities + european_cities
#  #  keywords = eval(parameter)
#  #  p 'ENTITIES DETERMINATION'
#  #  p parameter
#  #  p msg
#  #  p context

#  #  tokenized_array = msg.downcase.split
#  #  keywords.each do |array|
#  #    if (tokenized_array & array).any?
#  #      p "FIRST ARRAY"
#  #      p array.first
#  #      context[parameter] = array.first
#  #      context["intent"] = parameter
#  #    end
#  #  end
#  #  p "UPDATED CONTEXT"
#  #  p context

#  #hash = {"object"=>"page", "entry"=>[{"id"=>"1767651676814105", "time"=>1465390250936, "messaging"=>[{"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390219801, "message"=>{"mid"=>"mid.1465390219798:2270a22c43baa22514", "seq"=>8686, "text"=>"Hey"}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390222663, "read"=>{"watermark"=>1465390222401, "seq"=>8689}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390226788, "read"=>{"watermark"=>1465390226515, "seq"=>8692}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390230850, "read"=>{"watermark"=>1465390230599, "seq"=>8695}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390236289, "read"=>{"watermark"=>1465390236042, "seq"=>8698}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390237029, "read"=>{"watermark"=>1465390236608, "seq"=>8701}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390240890, "read"=>{"watermark"=>1465390240698, "seq"=>8706}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390241212, "read"=>{"watermark"=>1465390240704, "seq"=>8708}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390243470, "message"=>{"mid"=>"mid.1465390242729:d41703dd165b96bf84", "seq"=>8709, "attachments"=>[{"title"=>"Matthias's Location", "url"=>"https://www.facebook.com/l.php?u=https%3A%2F%2Fwww.bing.com%2Fmaps%2Fdefault.aspx%3Fv%3D2%26pc%3DFACEBK%26mid%3D8100%26where1%3D48.856127617382%252C%2B2.3856524838621%26FORM%3DFBKPL1%26mkt%3Den-US&h=SAQGj3UGM&s=1&enc=AZOESASMT5b3TGkFAJZHf_CF70qjAmYMwBbiN4QWasK5_FNzsFJzz41baZUcDvTt4D3JNEJUO7W6409vWNXYm6nLtcU_pzaLMW-VI3BBWDV9vA", "type"=>"location", "payload"=>{"coordinates"=>{"lat"=>48.856127617382, "long"=>2.3856524838621}}}]}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390245217, "read"=>{"watermark"=>1465390244933, "seq"=>8712}}]}], "station"=>{"object"=>"page", "entry"=>[{"id"=>"1767651676814105", "time"=>1465390250936, "messaging"=>[{"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390219801, "message"=>{"mid"=>"mid.1465390219798:2270a22c43baa22514", "seq"=>8686, "text"=>"Hey"}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390222663, "read"=>{"watermark"=>1465390222401, "seq"=>8689}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390226788, "read"=>{"watermark"=>1465390226515, "seq"=>8692}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390230850, "read"=>{"watermark"=>1465390230599, "seq"=>8695}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390236289, "read"=>{"watermark"=>1465390236042, "seq"=>8698}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390237029, "read"=>{"watermark"=>1465390236608, "seq"=>8701}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390240890, "read"=>{"watermark"=>1465390240698, "seq"=>8706}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390241212, "read"=>{"watermark"=>1465390240704, "seq"=>8708}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390243470, "message"=>{"mid"=>"mid.1465390242729:d41703dd165b96bf84", "seq"=>8709, "attachments"=>[{"title"=>"Matthias's Location", "url"=>"https://www.facebook.com/l.php?u=https%3A%2F%2Fwww.bing.com%2Fmaps%2Fdefault.aspx%3Fv%3D2%26pc%3DFACEBK%26mid%3D8100%26where1%3D48.856127617382%252C%2B2.3856524838621%26FORM%3DFBKPL1%26mkt%3Den-US&h=SAQGj3UGM&s=1&enc=AZOESASMT5b3TGkFAJZHf_CF70qjAmYMwBbiN4QWasK5_FNzsFJzz41baZUcDvTt4D3JNEJUO7W6409vWNXYm6nLtcU_pzaLMW-VI3BBWDV9vA", "type"=>"location", "payload"=>{"coordinates"=>{"lat"=>48.856127617382, "long"=>2.3856524838621}}}]}}, {"sender"=>{"id"=>"10153707824968697"}, "recipient"=>{"id"=>"1767651676814105"}, "timestamp"=>1465390245217, "read"=>{"watermark"=>1465390244933, "seq"=>8712}}]}]}}
#  p hash["entry"][0]["messaging"][8]["message"]["attachments"].first["payload"]["coordinates"]
# concert_url = "http://api.songkick.com/api/3.0/metro_areas/24426/calendar.json?apikey=h76Z5PDgOid28Zly"
# concerts = Oj.load(RestClient.get concert_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"][0..5]

# concerts.each do |c|
#   # p c["performance"].first["artist"]["uri"]
#   # p c["displayName"]
#   # p c["venue"]["displayName"]
#   p c["start"]["datetime"].class
#   p DateTime.parse(c["start"]["datetime"]).class
#   p DateTime.parse(c["start"]["datetime"]).strftime("%B %d at %l:%M%P")
#   # p c["start"]["datetime"].strptime("%B%d at %l:%M%p")
#   a = Mechanize.new { |agent|
#     agent.user_agent_alias = 'Mac Safari'
#   }
#   a.get(c["performance"].first["artist"]["uri"]) do |page|
#     ap "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
#   end
# end
#  geo_loc = "http://api.songkick.com/api/3.0/search/locations.json?location=geo:51.507351,-0.127758&apikey=h76Z5PDgOid28Zly"
#   #p geo_loc
# ap locations =  Oj.load(RestClient.get geo_loc, :content_type => :json, :accept => :json)["resultsPage"]["results"]["location"][0..40]
# lc = locations.uniq{|loc| loc["city"]["displayName"]}
# lc.count
#p Geocoder.search("Issy les moulinneaux")[0].data["address_components"][0]["long_name"]
#[#<Geocoder::Result::Google:0x007f00ae4a8ae8 @data={"address_components"=>[{"long_name"=>"Marseille", "short_name"=>"Marseille", "types"=>["locality", "political"]}, {"long_name"=>"Bouches-du-Rhone", "short_name"=>"Bouches-du-Rhone", "types"=>["administrative_area_level_2", "political"]}, {"long_name"=>"Provence-Alpes-Côte d'Azur", "short_name"=>"Provence-Alpes-Côte d'Azur", "types"=>["administrative_area_level_1", "political"]}, {"long_name"=>"France", "short_name"=>"FR", "types"=>["country", "political"]}], "formatted_address"=>"Marseille, France", "geometry"=>{"bounds"=>{"northeast"=>{"lat"=>43.3911601, "lng"=>5.5323519}, "southwest"=>{"lat"=>43.169621, "lng"=>5.228641}}, "location"=>{"lat"=>43.296482, "lng"=>5.36978}, "location_type"=>"APPROXIMATE", "viewport"=>{"northeast"=>{"lat"=>43.3911601, "lng"=>5.5323519}, "southwest"=>{"lat"=>43.169621, "lng"=>5.277926100000001}}}, "place_id"=>"ChIJM1PaREO_yRIRIAKX_aUZCAQ", "types"=>["locality", "political"]}, @cache_hit=nil>]
