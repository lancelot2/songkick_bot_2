# method for laying out the 10 cities available in the US

def europe(sender)
  structured_reply = GenericTemplate.new

  berlin_button = Button.new
  berlin_button.add_postback("Concerts in Berlin","Berlin")
  structured_reply.add_element("Berlin", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712857/SongKick/berlin.png", "", [berlin_button.get_message] )

  paris_button = Button.new
  paris_button.add_postback("Concerts in Paris","Paris")
  structured_reply.add_element("Paris", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712883/SongKick/paris.png", "", [paris_button.get_message] )

  amsterdam_button = Button.new
  amsterdam_button.add_postback("Concerts in Amsterdam","Amsterdam")
  structured_reply.add_element("Amsterdam", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712851/SongKick/amsterdam.png", "", [amsterdam_button.get_message] )

  barcelona_button = Button.new
  barcelona_button.add_postback("Concerts in Barcelona","Barcelona")
  structured_reply.add_element("Barcelona", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712892/SongKick/barcelona.png", "", [barcelona_button.get_message] )

  copenhagen_button = Button.new
  copenhagen_button.add_postback("Concerts in Copenhagen","Copenhagen")
  structured_reply.add_element("Copenhagen", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712869/SongKick/copenhagen.png", "", [copenhaguen_button.get_message] )

  stockholm_button = Button.new
  stockholm_button.add_postback("Concerts in Stockholm","Stockholm")
  structured_reply.add_element("Stockholm", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712855/SongKick/stockholm.png", "", [stockholm_button.get_message] )

  dublin_button = Button.new
  dublin_button.add_postback("Concerts in Dublin","Dublin")
  structured_reply.add_element("Dublin", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712866/SongKick/dublin.png", "", [dublin_button.get_message] )

  prague_button = Button.new
  prague_button.add_postback("Concerts in Prague","Prague")
  structured_reply.add_element("Prague", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712887/SongKick/prague.png", "", [prague_button.get_message] )

  rome_button = Button.new
  rome_button.add_postback("Concerts in Rome","Rome")
  structured_reply.add_element("Rome", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712892/SongKick/rome.png", "", [rome_button.get_message] )

  budapest_button = Button.new
  budapest_button.add_postback("Concerts in Budapest","Budapest")
  structured_reply.add_element("Budapest", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712860/SongKick/budapest.png", "", [budapest_button.get_message] )

  reply_transfer(session, sender, structured_reply)
end


