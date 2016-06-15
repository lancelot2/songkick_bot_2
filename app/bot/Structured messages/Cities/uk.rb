# method for laying out the 10 cities available in the UK

def uk(session, sender)
  structured_reply = GenericTemplate.new

  upcoming_concerts_in_london_button = Button.new
  upcoming_concerts_in_london_button.add_postback("Concerts in London","London")
  check_venues_in_london_button = Button.new
  check_venues_in_london_button.add_postback("Venues in London","London venues")
  structured_reply.add_element("London", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712875/SongKick/cities/london.png", "", [upcoming_concerts_in_london_button.get_message, check_venues_in_london_button.get_message])

  upcoming_concerts_in_manchester_button = Button.new
  upcoming_concerts_in_manchester_button.add_postback("Concerts in Manchester","Manchester")
  check_venues_in_manchester_button = Button.new
  check_venues_in_manchester_button.add_postback("Venues in Manchester","Manchester venues")
  structured_reply.add_element("Manchester", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712878/SongKick/cities/manchester.png", "", [upcoming_concerts_in_manchester_button.get_message, check_venues_in_manchester_button.get_message])

  upcoming_concerts_in_glasgow_button = Button.new
  upcoming_concerts_in_glasgow_button.add_postback("Concerts in Glasgow","Glasgow")
  check_venues_in_glasgow_button = Button.new
  check_venues_in_glasgow_button.add_postback("Venues in Glasgow","Glasgow venues")
  structured_reply.add_element("Glasgow", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712872/SongKick/cities/glasgow.png", "", [upcoming_concerts_in_glasgow_button.get_message, check_venues_in_glasgow_button.get_message])

  upcoming_concerts_in_edinburgh_button = Button.new
  upcoming_concerts_in_edinburgh_button.add_postback("Concerts in Edinburgh","Edinburgh")
  check_venues_in_edinburgh_button = Button.new
  check_venues_in_edinburgh_button.add_postback("Venues in Edinburgh","Edinburgh venues")
  structured_reply.add_element("Edinburgh", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712871/SongKick/cities/edinburgh.png", "", [upcoming_concerts_in_edinburgh_button.get_message, check_venues_in_edinburgh_button.get_message])

  upcoming_concerts_in_birmingham_button = Button.new
  upcoming_concerts_in_birmingham_button.add_postback("Concerts in Birmingham","Birmingham")
  check_venues_in_birmingham_button = Button.new
  check_venues_in_birmingham_button.add_postback("Venues in Birmingham","Birmingham venues")
  structured_reply.add_element("Birmingham", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712858/SongKick/cities/birmingham.png", "", [upcoming_concerts_in_birmingham_button.get_message, check_venues_in_birmingham_button.get_message])

  upcoming_concerts_in_newcastle_button = Button.new
  upcoming_concerts_in_newcastle_button.add_postback("Concerts in Newcastle","Newcastle")
  check_venues_in_newcastle_button = Button.new
  check_venues_in_newcastle_button.add_postback("Venues in Newcastle","Newcastle venues")
  structured_reply.add_element("Newcastle", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712880/SongKick/cities/newcastle.png", "", [upcoming_concerts_in_newcastle_button.get_message, check_venues_in_newcastle_button.get_message])

  upcoming_concerts_in_bristol_button = Button.new
  upcoming_concerts_in_bristol_button.add_postback("Concerts in Bristol","Bristol")
  check_venues_in_bristol_button = Button.new
  check_venues_in_bristol_button.add_postback("Venues in Bristol","Bristol venues")
  structured_reply.add_element("Bristol", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712868/SongKick/cities/bristol.png", "", [upcoming_concerts_in_bristol_button.get_message, check_venues_in_bristol_button.get_message])

  upcoming_concerts_in_belfast_button = Button.new
  upcoming_concerts_in_belfast_button.add_postback("Concerts in Belfast","Belfast")
  check_venues_in_belfast_button = Button.new
  check_venues_in_belfast_button.add_postback("Venues in Belfast","Belfast venues")
  structured_reply.add_element("Belfast", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712855/SongKick/cities/belfast.png", "", [upcoming_concerts_in_belfast_button.get_message, check_venues_in_belfast_button.get_message])

  upcoming_concerts_in_brighton_button = Button.new
  upcoming_concerts_in_brighton_button.add_postback("Concerts in Brighton","Brighton")
  check_venues_in_brighton_button = Button.new
  check_venues_in_brighton_button.add_postback("Venues in Brighton","Brighton venues")
  structured_reply.add_element("Brighton", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712859/SongKick/cities/brighton.png", "", [upcoming_concerts_in_brighton_button.get_message, check_venues_in_brighton_button.get_message])

  upcoming_concerts_in_liverpool_button = Button.new
  upcoming_concerts_in_liverpool_button.add_postback("Concerts in Liverpool","Liverpool")
  check_venues_in_liverpool_button = Button.new
  check_venues_in_liverpool_button.add_postback("Venues in Liverpool","Liverpool venues")
  structured_reply.add_element("Liverpool", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712873/SongKick/cities/liverpool.png", "", [upcoming_concerts_in_liverpool_button.get_message, check_venues_in_liverpool_button.get_message])

  reply_transfer(session, sender, structured_reply)
end


