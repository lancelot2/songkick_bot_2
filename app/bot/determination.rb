# manage to determinate which intent has the user requested to see
def intent_determination(msg, context, sender, session)
  previous_context = context.clone
  keywords = [["help"],
              ["bye"],
              ["exit"],
              ["back"],
              ["mainbrowsing"],
              ["no", "nope", "fuck", "off", "bye", "fuckoff"],
              ["yes", "yeah", "yep"],
              ["country", "countries", "city", "cities"],
              ["venues", "venue"],
              ["artists", "artist"]]

  tokenized_array = msg.downcase.split

  keywords.each do |array|
    if (tokenized_array & array).any?
      context["intent"] = array.first
    end
  end
  context
end


# Method for figuring out which parameter has been selected by the user
def entities_determination(msg, context, parameter)
  # Complete keyword array with bot specific keywords
  countries = [["usa", "us", "states", "america", "united states"], ["uk", "great britain", "united kingdom", "england", "scotland"], ["europe", "france", "germany", "holland", "danemark", "sweden", "spain", "ireland", "italy", "hungary"]]
  usa_cities = [["san francisco", "sf"], ["los angeles", "la"], ["new york", "new-york", "ny", "nyc"], ["portland"], ["washington"], ["philadelphia"], ["seattle"], ["chicago"], ["orlando"], ["pittsburg"]]
  uk_cities = [["london", "ldn"], ["manchester"], ["glasgow"], ["edinburgh"], ["birmingham"], ["newcastle"], ["bristol"], ["belfast"], ["brighton"], ["liverpool"]]
  european_cities = [["paris", "pari"], ["berlin"], ["amsterdam"], ["barcelona"], ["copenhagen"], ["stockholm"], ["dublin"], ["prague"], ["rome"], ["budapest"]]
  keywords = countries + usa_cities + uk_cities + european_cities
  p keywords
  p 'ENTITIES DETERMINATION'
  p msg
  p context

  tokenized_array = msg.downcase.split
  keywords.each do |array|
    if (tokenized_array & array).any?
       p "FIRST ARRAY"
       p array.first
       context[parameter] = array.first
       context["intent"] = parameter
    end
  end
  p "UPDATED CONTEXT"
  p context
end

def address_formatting(msg, session)
  context = session.context
  search = Geocoder.search(msg)[0].data["address_components"]
  country = search[5]["long_name"]
  area = search[4]["long_name"]
  city = search[3]["long_name"]
  zipcode = search[6]["long_name"]
  address = search[0]["long_name"] + " " + search[1]["long_name"]

  context["country"] = country
  context["city"] = city
  context["zipcode"] = zipcode
  context["address"] = address
  context["area"] = area

  session.update(context: context)
end
