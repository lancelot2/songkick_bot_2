# method for laying out the 10 cities available in the UK

def usa(sender)
  structured_reply = GenericTemplate.new

  upcoming_concerts_in_san_francisco_button = Button.new
  upcoming_concerts_in_san_francisco_button.add_postback("Concerts in SF","sf")
  check_venues_in_san_francisco_button = Button.new
  check_venues_in_san_francisco_button.add_postback("Venues in SF","sf venues")
  structured_reply.add_element("San Francisco", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1465479573/SongKick/cities/san_francisco_3.png", "", [upcoming_concerts_in_san_francisco_button.get_message, check_venues_in_san_francisco_button.get_message] )

  upcoming_concerts_in_los_angeles_button = Button.new
  upcoming_concerts_in_los_angeles_button.add_postback("Concerts in LA","los angeles")
  check_venues_in_los_angeles_button = Button.new
  check_venues_in_los_angeles_button.add_postback("Venues in LA","los angeles")
  structured_reply.add_element("Los Angeles", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712876/SongKick/cities/los_angeles.png", "", [upcoming_concerts_in_los_angeles_button.get_message, check_venues_in_los_angeles_button.get_message] )

  upcoming_concerts_in_new_york_button = Button.new
  upcoming_concerts_in_new_york_button.add_postback("Concerts in NYC","New York")
  check_venues_in_new_york_button = Button.new
  check_venues_in_new_york_button.add_postback("Venues in NYC","New York venues")
  structured_reply.add_element("New York", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712879/SongKick/cities/new_york.png", "", [upcoming_concerts_in_new_york_button.get_message, check_venues_in_new_york_button.get_message] )

  upcoming_concerts_in_portland_button = Button.new
  upcoming_concerts_in_portland_button.add_postback("Concerts in Portland","Portland")
  check_venues_in_portland_button = Button.new
  check_venues_in_portland_button.add_postback("Venues in Portland","Portland venues")
  structured_reply.add_element("Portland", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712886/SongKick/cities/portland.png", "", [upcoming_concerts_in_portland_button.get_message, check_venues_in_portland_button.get_message] )

  upcoming_concerts_in_washington_button = Button.new
  upcoming_concerts_in_washington_button.add_postback("Concerts in Washington","Washington")
  check_venues_in_washington_button = Button.new
  check_venues_in_washington_button.add_postback("Venues in Washington","Washington venues")
  structured_reply.add_element("Washington", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712864/SongKick/cities/washington.png", "", [upcoming_concerts_in_washington_button.get_message, check_venues_in_washington_button.get_message] )

  upcoming_concerts_in_philadelphia_button = Button.new
  upcoming_concerts_in_philadelphia_button.add_postback("Concerts in Philly","Philadelphia")
  check_venues_in_philadelphia_button = Button.new
  check_venues_in_philadelphia_button.add_postback("Venues in Philly","Philadelphia venues")
  structured_reply.add_element("Philadelphia", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712884/SongKick/cities/philadelphia.png", "", [upcoming_concerts_in_philadelphia_button.get_message, check_venues_in_philadelphia_button.get_message] )

  upcoming_concerts_in_seattle_button = Button.new
  upcoming_concerts_in_seattle_button.add_postback("Concerts in Seattle","Seattle")
  check_venues_in_seattle_button = Button.new
  check_venues_in_seattle_button.add_postback("Venues in Seattle","Seattle venues")
  structured_reply.add_element("Seattle", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712892/SongKick/cities/seattle.png", "", [upcoming_concerts_in_seattle_button.get_message, check_venues_in_seattle_button.get_message] )

  upcoming_concerts_in_chicago_button = Button.new
  upcoming_concerts_in_chicago_button.add_postback("Concerts in Chicago","Chicago")
  check_venues_in_chicago_button = Button.new
  check_venues_in_chicago_button.add_postback("Venues in Chicago","Chicago venues")
  structured_reply.add_element("Chicago", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712862/SongKick/cities/chicago.png", "", [upcoming_concerts_in_chicago_button.get_message, check_venues_in_chicago_button.get_message] )

  upcoming_concerts_in_orlando_button = Button.new
  upcoming_concerts_in_orlando_button.add_postback("Concerts in Orlando","Orlando")
  check_venues_in_orlando_button = Button.new
  check_venues_in_orlando_button.add_postback("Venues in Orlando","Orlando venues")
  structured_reply.add_element("Orlando", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712882/SongKick/cities/orlando.png", "", [upcoming_concerts_in_orlando_button.get_message, check_venues_in_orlando_button.get_message] )

  upcoming_concerts_in_pittsburg_button = Button.new
  upcoming_concerts_in_pittsburg_button.add_postback("Concerts in Pittsburg","Pittsburg")
  check_venues_in_pittsburg_button = Button.new
  check_venues_in_pittsburg_button.add_postback("Venues in Pittsburg","Pittsburg venues")
  structured_reply.add_element("Pittsburg", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712890/SongKick/cities/pittsburg.png", "", [upcoming_concerts_in_pittsburg_button.get_message, check_venues_in_pittsburg_button.get_message] )

  reply_transfer(session, sender, structured_reply)
end

