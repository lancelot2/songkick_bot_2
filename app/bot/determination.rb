def intent_determination(msg, context, sender, session)
  p "PREVIOUS CONTEXT"
  previous_context = context.clone
  p previous_context
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

  p "CONTEXT"
  p context
  context
end


# Method for figuring out which parameter has been selected by the user
def entities_determination(msg, context, parameter)
  # Complete keyword array with bot specific keywords
  countries = [["US", "USA", "States", "America", "United States"], ["UK", "Great Britain", "United Kingdom", "England", "Scotland"], ["Europe", "France", "Germany", "Holland", "Danemark", "Sweden", "Spain", "Ireland", "Italy", "Hungary"]]
  usa_cities = [["San Francisco", "SF"], ["Los Angeles", "LA"], ["New York", "New-York", "NY", "NYC"], ["Portland"], ["Washington"], ["Philadelphia"], ["Seattle"], ["Chicago"], ["Orlando"], ["Pittsburg"]]
  uk_cities = [["London", "ldn"], ["Manchester"], ["Glasgow"], ["Edinburgh"], ["Birmingham"], ["Newcastle"], ["Bristol"], ["Belfast"], ["Brighton"], ["Liverpool"]]
  european_cities = [["Paris", "Pari"], ["Berlin"], ["Amsterdam"], ["Barcelona"], ["Copenhagen"], ["Stockholm"], ["Dublin"], ["Prague"], ["Rome"], ["Budapest"]]
  keywords = [countries, usa_cities, uk_cities, european_cities]

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
