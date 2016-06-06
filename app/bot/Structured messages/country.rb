# method for laying out the 3 geographical areas

Countries = [["US", "USA", "States", "America", "United States"], ["UK", "Great Britain", "United Kingdom", "England", "Scotland"], ["Europe", "France", "Germany", "Holland", "Danemark", "Sweden", "Spain", "Ireland", "Italy", "Hungary"]]

def cta_country_message(sender)
  structured_reply = GenericTemplate.new

  usa_button = Button.new
  usa_button.add_postback("View","USA")
  structured_reply.add_element("USA", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712864/SongKick/us_flag.png", "", [usa_button.get_message] )

  uk_button = Button.new
  uk_button.add_postback("View","UK")
  structured_reply.add_element("UK", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712861/SongKick/uk_flag.png", "", [uk_button.get_message] )

  europe_button = Button.new
  europe_button.add_postback("View","Europe")
  structured_reply.add_element("Europe", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712869/SongKick/europe_flag.png", "", [europe_button.get_message] )

  reply_transfer(session, sender, structured_reply)
end


