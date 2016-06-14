# manage to determinate which intent has the user requested to see
def intent_determination(msg, context, sender, session)
  previous_context = context.clone
  keywords = [["help"],
              ["bye"],
              ["exit"],
              ["back"],
              ["upcoming"],
              ["details"],
              ["reviews"],
              ["mainbrowsing"],
              ["popular_artists"],
              ["trending_artists"],
              ["no", "nope", "fuck", "off", "bye", "fuckoff"],
              ["yes", "yeah", "yep"],
              ["country", "countries", "city", "cities"],
              ["venue", "venues"],
              ["artists", "artist"]]

  tokenized_array = msg.downcase.split
  keywords.each do |array|
    if (tokenized_array & array).any?
      context["intent"] = array.first
    end
  end
  p "PREVIOUS"
  p previous_context
  p "CONTEXT"
  p context
  if previous_context["intent"] == "country" && context["city"].nil? && context["lat"].present?
    context["intent"] = "geolocated"
  elsif previous_context["intent"] == "city" && context["city"].present? && context["intent"] == "venue" && context["country"].present? && context.size > 3
    context["intent"] = "venue"
  elsif context["city"].present? && context["intent"] == "artists" && context["venue_id"].present? && previous_context["intent"] == "show_concerts"
    context["intent"] = "single_card"
    context["artist_url"] = msg.gsub(" artists", "")
  elsif context["city"].present? && context["intent"] == "venue" && context["venue_id"].present? && previous_context["intent"] == "show_concerts"
    context["intent"] = "single_card"
    context["artist_url"] = msg.gsub(" artists", "")
  elsif previous_context["intent"] == "city" && context["city"].present? && context["intent"] == "artists" && context.size > 3
    context["intent"] = "single_card"
    context["venue_url"] = msg.gsub(" venues", "")
  elsif previous_context["intent"] == "city" && context["city"].present? && context["intent"] == "venue" && context.size > 3
    context["intent"] = "single_card"
    context["venue_url"] = msg.gsub(" venues", "")
  elsif previous_context["intent"] == "country" && context["city"].nil? && context["country"].nil?
    address_formatting(msg, session)
    username = sender.get_profile[:body]["first_name"]
    entity(session, username, sender, msg, "city")
  elsif previous_context["intent"] == "venue" && previous_context["city"].present?
    context["venue_id"] = msg
    context["intent"] = "show_concerts"
  elsif previous_context["intent"].nil? && context["intent"].nil?
    context["intent"] = "start"
  elsif previous_context["intent"] == "trending_artists" && context["intent"] == "upcoming"
    p "TRUE"
    context["artist_id"] = msg.gsub("upcoming :", "")
  elsif previous_context["intent"] == "trending_artists" && context["intent"] == "reviews"
    context["artist_id"] = msg.gsub("reviews :", "")
    context["artist_id"] = msg.gsub(/[^\d]/, '')
    context["artist_name"] = msg.gsub("details :", "").gsub(/\d/, "")
    p context["artist_url"] = "http://www.songkick.com/artists/" + context["artist_id"] + "-" + context["artist_name"].strip.downcase
    p msg
    p msg.gsub(/[^\d]/, '')
    p msg.gsub("details :", "").gsub(/\d/, "")
    p "HERE"
  elsif previous_context["intent"] == "trending_artists" && context["intent"] == "details"
    context["artist_id"] = msg.gsub("details :", "")
    context["artist_id"] = msg.gsub(/[^\d]/, '')
    context["artist_name"] = msg.gsub("details :", "").gsub(/\d/, "")
    p context["artist_url"] = "http://www.songkick.com/artists/" + context["artist_id"] + "-" + context["artist_name"].strip.downcase
    p msg
    p msg.gsub(/[^\d]/, '')
    p msg.gsub("details :", "").gsub(/\d/, "")
    p "HERE"
  elsif previous_context["intent"] == "popular_artists" && context["intent"] == "upcoming"
    p "TRUE"
    context["artist_id"] = msg.gsub("upcoming :", "")
  elsif previous_context["intent"] == "popular_artists" && context["intent"] == "reviews"
    context["artist_id"] = msg.gsub("details :", "")
    context["artist_id"] = msg.gsub(/[^\d]/, '')
    context["artist_name"] = msg.gsub("details :", "").gsub(/\d/, "")
    p context["artist_url"] = "http://www.songkick.com/artists/" + context["artist_id"] + "-" + context["artist_name"].strip.downcase
    p msg
    p msg.gsub(/[^\d]/, '')
    p msg.gsub("details :", "").gsub(/\d/, "")
    p "HERE"
  elsif previous_context["intent"] == "popular_artists" && context["intent"] == "details"
    context["artist_id"] = msg.gsub(/[^\d]/, '')
    context["artist_name"] = msg.gsub("details :", "").gsub(/\d/, "")
    p context["artist_url"] = "http://www.songkick.com/artists/" + context["artist_id"] + "-" + context["artist_name"].strip.downcase
    p msg
    p msg.gsub(/[^\d]/, '')
    p msg.gsub("details :", "").gsub(/\d/, "")
    p "HERE"
  end
  context
end


# Method for figuring out which parameter has been selected by the user
def entities_determination(session, msg, context, parameter)
  # Complete keyword array with bot specific keywords
  previous_context = context.clone
  country = [["usa", "us", "states", "america", "united states"], ["uk", "great britain", "united kingdom", "england", "scotland"], ["europe", "france", "germany", "holland", "danemark", "sweden", "spain", "ireland", "italy", "hungary"]]
  usa_cities = [["sf", "san francisco"], ["los angeles", "la"], ["new york", "new-york", "ny", "nyc"], ["portland"], ["washington"], ["philadelphia"], ["seattle"], ["chicago"], ["orlando"], ["pittsburg"]]
  uk_cities = [["london", "ldn"], ["manchester"], ["glasgow"], ["edinburgh"], ["birmingham"], ["newcastle"], ["bristol"], ["belfast"], ["brighton"], ["liverpool"]]
  european_cities = [["paris", "pari"], ["berlin"], ["amsterdam"], ["barcelona"], ["copenhagen"], ["stockholm"], ["dublin"], ["prague"], ["rome"], ["budapest"]]
  city = usa_cities + uk_cities + european_cities
  keywords = eval(parameter)

  tokenized_array = msg.downcase.split
  keywords.each do |array|
    if (tokenized_array & array).any?
      context[parameter] = array.first
      context["intent"] = parameter
    end
  end
  context
end

def address_formatting(msg, session)
  context = session.context
  city = Geocoder.search(msg)[0].data["address_components"][0]["long_name"]
  p "ADDRESS FORMATING"
  context["city"] = city
  context["intent"] = "city"
  p context
  session.update(context: context)
end
