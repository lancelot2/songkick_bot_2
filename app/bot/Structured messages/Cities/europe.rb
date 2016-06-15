# method for laying out the 10 cities available in the US

def europe(session, sender)
  structured_reply = GenericTemplate.new

  upcoming_concerts_in_berlin_button = Button.new
  upcoming_concerts_in_berlin_button.add_postback("Concerts in Berlin","Berlin")
  check_venues_in_berlin_button = Button.new
  check_venues_in_berlin_button.add_postback("Venues in Berlin","Berlin")
  structured_reply.add_element("Berlin", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712857/SongKick/cities/berlin.png", "", [upcoming_concerts_in_berlin_button.get_message, check_venues_in_berlin_button.get_message] )

  upcoming_concerts_in_paris_button = Button.new
  upcoming_concerts_in_paris_button.add_postback("Concerts in Paris","Paris")
  check_venues_in_paris_button = Button.new
  check_venues_in_paris_button.add_postback("Venues in Paris","Paris")
  structured_reply.add_element("Paris", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712883/SongKick/cities/paris.png", "", [upcoming_concerts_in_paris_button.get_message, check_venues_in_paris_button.get_message] )

  upcoming_concerts_in_amsterdam_button = Button.new
  upcoming_concerts_in_amsterdam_button.add_postback("Concerts in Amsterdam","Amsterdam")
  check_venues_in_amsterdam_button = Button.new
  check_venues_in_amsterdam_button.add_postback("Venues in Amsterdam","Amsterdam")
  structured_reply.add_element("Amsterdam", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712851/SongKick/cities/amsterdam.png", "", [upcoming_concerts_in_amsterdam_button.get_message, check_venues_in_amsterdam_button.get_message] )

  upcoming_concerts_in_barcelona_button = Button.new
  upcoming_concerts_in_barcelona_button.add_postback("Concerts in Barcelona","Barcelona")
  check_venues_in_barcelona_button = Button.new
  check_venues_in_barcelona_button.add_postback("Venues in Barcelona","Barcelona")
  structured_reply.add_element("Barcelona", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712892/SongKick/cities/barcelona.png", "", [upcoming_concerts_in_barcelona_button.get_message, check_venues_in_barcelona_button.get_message] )

  upcoming_concerts_in_copenhagen_button = Button.new
  upcoming_concerts_in_copenhagen_button.add_postback("Concerts in Copenhagen","Copenhagen")
  check_venues_in_copenhagen_button = Button.new
  check_venues_in_copenhagen_button.add_postback("Venues in Copenhagen","Copenhagen")
  structured_reply.add_element("Copenhagen", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712869/SongKick/cities/copenhagen.png", "", [upcoming_concerts_in_copenhagen_button.get_message, check_venues_in_copenhagen_button.get_message] )

  upcoming_concerts_in_stockholm_button = Button.new
  upcoming_concerts_in_stockholm_button.add_postback("Concerts in Stockholm","Stockholm")
  check_venues_in_stockholm_button = Button.new
  check_venues_in_stockholm_button.add_postback("Venues in Stockholm","Stockholm")
  structured_reply.add_element("Stockholm", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712855/SongKick/cities/stockholm.png", "", [upcoming_concerts_in_stockholm_button.get_message, check_venues_in_stockholm_button.get_message] )

  upcoming_concerts_in_dublin_button = Button.new
  upcoming_concerts_in_dublin_button.add_postback("Concerts in Dublin","Dublin")
  check_venues_in_dublin_button = Button.new
  check_venues_in_dublin_button.add_postback("Venues in Dublin","Dublin")
  structured_reply.add_element("Dublin", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712866/SongKick/cities/dublin.png", "", [upcoming_concerts_in_dublin_button.get_message, check_venues_in_dublin_button.get_message] )

  upcoming_concerts_in_prague_button = Button.new
  upcoming_concerts_in_prague_button.add_postback("Concerts in Prague","Prague")
  check_venues_in_prague_button = Button.new
  check_venues_in_prague_button.add_postback("Venues in Prague","Prague")
  structured_reply.add_element("Prague", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712887/SongKick/cities/prague.png", "", [upcoming_concerts_in_prague_button.get_message, check_venues_in_prague_button.get_message] )

  upcoming_concerts_in_rome_button = Button.new
  upcoming_concerts_in_rome_button.add_postback("Concerts in Rome","Rome")
  check_venues_in_rome_button = Button.new
  check_venues_in_rome_button.add_postback("Venues in Rome","Rome")
  structured_reply.add_element("Rome", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712892/SongKick/cities/rome.png", "", [upcoming_concerts_in_rome_button.get_message, check_venues_in_rome_button.get_message] )

  upcoming_concerts_in_budapest_button = Button.new
  upcoming_concerts_in_budapest_button.add_postback("Concerts in Budapest","Budapest")
  check_venues_in_budapest_button = Button.new
  check_venues_in_budapest_button.add_postback("Venues in Budapest","Budapest")
  structured_reply.add_element("Budapest", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712860/SongKick/cities/budapest.png", "", [upcoming_concerts_in_budapest_button.get_message, check_venues_in_budapest_button.get_message] )

  reply_transfer(session, sender, structured_reply)
end


