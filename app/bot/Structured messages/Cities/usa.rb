# method for laying out the 10 cities available in the UK

def usa(sender)
  structured_reply = GenericTemplate.new

  san_francisco_button = Button.new
  san_francisco_button.add_postback("View concerts in SF","sf")
  structured_reply.add_element("San Francisco", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1465479573/SongKick/cities/san_francisco_3.png", "", [san_francisco_button.get_message] )

  los_angeles_button = Button.new
  los_angeles_button.add_postback("View concerts in LA","los angeles")
  structured_reply.add_element("Los Angeles", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712876/SongKick/cities/los_angeles.png", "", [los_angeles_button.get_message] )

  new_york_button = Button.new
  new_york_button.add_postback("View concerts in NYC","New York")
  structured_reply.add_element("New York", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712879/SongKick/cities/new_york.png", "", [new_york_button.get_message] )

  portland_button = Button.new
  portland_button.add_postback("View concerts in Portland","Portland")
  structured_reply.add_element("Portland", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712886/SongKick/cities/portland.png", "", [portland_button.get_message] )

  washington_button = Button.new
  washington_button.add_postback("View concerts in Washington","Washington")
  structured_reply.add_element("Washington", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712864/SongKick/cities/washington.png", "", [washington_button.get_message] )

  philadelphia_button = Button.new
  philadelphia_button.add_postback("View concerts in Philly","Philadelphia")
  structured_reply.add_element("Philadelphia", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712884/SongKick/cities/philadelphia.png", "", [philadelphia_button.get_message] )

  seattle_button = Button.new
  seattle_button.add_postback("View concerts in Seattle","Seattle")
  structured_reply.add_element("Seattle", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712892/SongKick/cities/seattle.png", "", [seattle_button.get_message] )

  chicago_button = Button.new
  chicago_button.add_postback("View concerts in Chicago","Chicago")
  structured_reply.add_element("Chicago", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712862/SongKick/cities/chicago.png", "", [chicago_button.get_message] )

  orlando_button = Button.new
  orlando_button.add_postback("View concerts in Orlando","Orlando")
  structured_reply.add_element("Orlando", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712882/SongKick/cities/orlando.png", "", [orlando_button.get_message] )

  pittsburg_button = Button.new
  pittsburg_button.add_postback("View concerts in Pittsburg","Pittsburg")
  structured_reply.add_element("Pittsburg", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712890/SongKick/cities/pittsburg.png", "", [pittsburg_button.get_message] )

  reply_transfer(session, sender, structured_reply)
end

