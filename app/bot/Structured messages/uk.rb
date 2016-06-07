# method for laying out the 10 cities available in the UK

def cta_country_message(sender)
  structured_reply = GenericTemplate.new

  london_button = Button.new
  london_button.add_postback("View concerts in London","London")
  structured_reply.add_element("London", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712875/SongKick/london.png", "", [london_button.get_message] )

  manchester_button = Button.new
  manchester_button.add_postback("View concerts in Manchester","Manchester")
  structured_reply.add_element("Manchester", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712878/SongKick/manchester.png", "", [manchester_button.get_message] )

  glasgow_button = Button.new
  glasgow_button.add_postback("View concerts in Glasgow","Glasgow")
  structured_reply.add_element("Glasgow", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712872/SongKick/glasgow.png", "", [glasgow_button.get_message] )

  edinburgh_button = Button.new
  edinburgh_button.add_postback("View concerts in Edinburgh","Edinburgh")
  structured_reply.add_element("Edinburgh", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712871/SongKick/edinburgh.png", "", [edinburgh_button.get_message] )

  birmingham_button = Button.new
  birmingham_button.add_postback("View concerts in Birmingham","Birmingham")
  structured_reply.add_element("Birmingham", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712858/SongKick/birmingham.png", "", [birmingham_button.get_message] )

  newcastle_button = Button.new
  newcastle_button.add_postback("View concerts in Newcastle","Newcastle")
  structured_reply.add_element("Newcastle", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712880/SongKick/newcastle.png", "", [newcastle_button.get_message] )

  bristol_button = Button.new
  bristol_button.add_postback("View concerts in Bristol","Bristol")
  structured_reply.add_element("Bristol", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712868/SongKick/bristol.png", "", [bristol_button.get_message] )

  belfast_button = Button.new
  belfast_button.add_postback("View concerts in Belfast","Belfast")
  structured_reply.add_element("Belfast", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712855/SongKick/belfast.png", "", [belfast_button.get_message] )

  brighton_button = Button.new
  brighton_button.add_postback("View concerts in Brighton","Brighton")
  structured_reply.add_element("Brighton", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712859/SongKick/brighton.png", "", [brighton_button.get_message] )

  liverpool_button = Button.new
  liverpool_button.add_postback("View concerts in Liverpool","Liverpool")
  structured_reply.add_element("Liverpool", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712873/SongKick/liverpool.png", "", [liverpool_button.get_message] )

  reply_transfer(session, sender, structured_reply)
end


