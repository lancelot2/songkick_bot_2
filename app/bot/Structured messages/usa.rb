# method for laying out the 10 cities available in the US

def usa(sender)
  structured_reply = GenericTemplate.new

  san_francisco_button = Button.new
  san_francisco_button.add_postback("Concerts in SF","Sf")
  structured_reply.add_element("San Francisco", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712851/SongKick/san_francisco.png", "", [san_francisco_button.get_message] )

  los_angeles_button = Button.new
  los_angeles_button.add_postback("Concerts in LA","La")
  structured_reply.add_element("Los Angeles", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712876/SongKick/los_angeles.png", "", [los_angeles_button.get_message] )

  new_york_button = Button.new
  new_york_button.add_postback("Concerts in NYC","Ny")
  structured_reply.add_element("New York", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712879/SongKick/new_york.png", "", [new_york_button.get_message] )

  portland_button = Button.new
  portland_button.add_postback("Concerts in Portland","Portland")
  structured_reply.add_element("Portland", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712886/SongKick/portland.png", "", [portland_button.get_message] )

  washington_button = Button.new
  washington_button.add_postback("Concerts in Washington","Washington")
  structured_reply.add_element("Washington", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712864/SongKick/washington.png", "", [washington_button.get_message] )

  philadelphia_button = Button.new
  philadelphia_button.add_postback("Concerts in Philly","Philadelphia")
  structured_reply.add_element("Philadelphia", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712884/SongKick/philadelphia.png", "", [philadelphia_button.get_message] )

  seattle_button = Button.new
  seattle_button.add_postback("Concerts in Seattle","Seattle")
  structured_reply.add_element("Seattle", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712892/SongKick/seattle.png", "", [seattle_button.get_message] )

  chicago_button = Button.new
  chicago_button.add_postback("Concerts in Chicago","Chicago")
  structured_reply.add_element("Chicago", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712862/SongKick/chicago.png", "", [chicago_button.get_message] )

  orlando_button = Button.new
  orlando_button.add_postback("Concerts in Orlando","Orlando")
  structured_reply.add_element("Orlando", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712882/SongKick/orlando.png", "", [orlando_button.get_message] )

  pittsburg_button = Button.new
  pittsburg_button.add_postback("Concerts in Pittsburg","Pittsburg")
  structured_reply.add_element("Pittsburg", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712890/SongKick/pittsburg.png", "", [pittsburg_button.get_message] )

  reply_transfer(session, sender, structured_reply)
end


