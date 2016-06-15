# method for laying out the 3 geographical areas

def country(sender)

  sender.reply({text: t('city-navigation-intro')})
  transfer_middle_office(session.id, sender, t('city-navigation-intro'), "bot")

  structured_reply = GenericTemplate.new

  usa_button = Button.new
  usa_button.add_postback("Check US cities","USA")
  structured_reply.add_element("Top 10 US cities", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712864/SongKick/us_flag.png", "", [usa_button.get_message] )

  uk_button = Button.new
  uk_button.add_postback("Check UK cities","UK")
  structured_reply.add_element("Top 10 UK cities", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712861/SongKick/uk_flag.png", "", [uk_button.get_message] )

  europe_button = Button.new
  europe_button.add_postback("Check European cities","Europe")
  structured_reply.add_element("Top 10 European cities", "", "http://res.cloudinary.com/dpy7x8rgs/image/upload/v1464712869/SongKick/europe_flag.png", "", [europe_button.get_message] )

  reply_transfer(session, sender, structured_reply)
end


