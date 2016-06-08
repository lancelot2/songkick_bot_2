def add_concert_card(concert, structured_reply)
    artist_page_url = concert["performance"].first["artist"]["uri"]
    concert_name = concert["displayName"]
    concert_date = concert["start"]["datetime"].strftime("%B%d at %l:%M%p")
    venue_name = concert["venue"]["displayName"]
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    a.get(concert["performance"].first["artist"]["uri"]) do |page|
      image_url =  "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
      artist_card_button = Button.new
      artist_card_button.add_postback("Check artist", "iD: artist_card")
      venue_card_button = Button.new
      venue_card_button.add_postback("Check venue", "iD: venue_card")
      ticket_external_link_button = Button.new
      ticket_external_link_button.add_postback("Buy tickets", "iD: ticket_external_link")
      structured_reply.add_element(concert_name, "", image_url, concert_date, [artist_card_button.get_message, venue_card_button.get_message, ticket_external_link_button.get_message])
    end

  structured_reply
end


def last_card(session, structured_reply, counter)
  context = session.context
  queries = session.queries.map{|q| q.attr}
  if (queries.include? "concert_type") && (queries.include? "vendor")
    viewmore_button = Button.new
    viewmore_button.add_postback("View more", "viewmore")
    pricerange_button = Button.new
    pricerange_button.add_postback("Filter price", "pricerange")
    structured_reply.add_element("See more concerts", "", "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png", "", [viewmore_button.get_message, pricerange_button.get_message])
  elsif (queries.include? "concert_type") && (queries.include? "pricerange")
    viewmore_button = Button.new
    viewmore_button.add_postback("View more", "viewmore")
    brands_button = Button.new
    brands_button.add_postback("Filter brands", "brands")
    structured_reply.add_element("See more concerts", "", "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png", "", [viewmore_button.get_message, brands_button.get_message])
  elsif (queries.include? "vendor") && (queries.include? "pricerange")
    viewmore_button = Button.new
    viewmore_button.add_postback("View more", "viewmore")
    categories_button = Button.new
    categories_button.add_postback("Filter categories", "categories")
    structured_reply.add_element("See more concerts", "", "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png", "", [viewmore_button.get_message, categories_button.get_message])
  elsif queries.include? "concert_type"
    viewmore_button = Button.new
    viewmore_button.add_postback("View more", "viewmore")
    pricerange_button = Button.new
    pricerange_button.add_postback("Filter price", "pricerange")
    brands_button = Button.new
    brands_button.add_postback("Filter brands", "brands")
    structured_reply.add_element("See more concerts", "", "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png", "", [viewmore_button.get_message, brands_button.get_message, pricerange_button.get_message])
  elsif queries.include? "pricerange"
    viewmore_button = Button.new
    viewmore_button.add_postback("View more", "viewmore")
    categories_button = Button.new
    categories_button.add_postback("Filter categories", "categories")
    brands_button = Button.new
    brands_button.add_postback("Filter brands", "brands")
    structured_reply.add_element("See more concerts", "", "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png", "", [viewmore_button.get_message, brands_button.get_message, categories_button.get_message])
  elsif queries.include? "vendor"
    viewmore_button = Button.new
    viewmore_button.add_postback("View more", "viewmore")
    categories_button = Button.new
    categories_button.add_postback("Filter categories", "categories")
    pricerange_button = Button.new
    pricerange_button.add_postback("Filter price", "pricerange")
    structured_reply.add_element("See more concerts", "", "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png", "", [viewmore_button.get_message, pricerange_button.get_message, categories_button.get_message])
  end
  if counter < 9
    structured_reply.get_message[:attachment][:payload][:elements].last[:title] = "Add a filter"
    unless structured_reply.get_message[:attachment][:payload][:elements].last[:buttons].nil?
      structured_reply.get_message[:attachment][:payload][:elements].last[:buttons].shift
    end
  end
  structured_reply
end


########## DISPLAY concertS WHEN THE QUERY RETURNS LESS THAN 9 concertS ##########
def less_than_9_concerts(session, concerts, sender, structured_reply)
  p "MOINS DE 9"
  context = session.context
  p concerts.count
  concerts[0..9].each do |concert|
    add_concert_card(concert, structured_reply)
  end
  last_card(session, structured_reply, 8)
  reply_transfer(session, sender, structured_reply)
end


########## DISPLAY concertS WHEN THERE ARE MORE THAN 9 concertS LEFT TO DISPLAY ##########
def more_than_9_concerts_left(concerts, session, concerts_showed, structured_reply)
  context = session.context
  concerts[concerts_showed..(concerts_showed + 8)].each do |concert|
    add_concert_card(concert, structured_reply)
  end
  p "PB CONTEXT"
  p context
  last_card(session, structured_reply, 10)
end

########## DISPLAY concertS WHEN THERE ARE LESS THAN 9 concertS LEFT TO DISPLAY ##########
def less_than_9_concerts_left(concerts, session, concerts_showed, structured_reply)
  context = session.context
  concerts[concerts_showed..(concerts_showed + 9)].each do |concert|
    add_concert_card(concert, structured_reply)
  end
  last_card(session, structured_reply, 8)
end

########## CHOOSES THE MESSAGE TO SEND BASED ON THE NUMBER OF concertS TO DISPLAY ##########
def generic_template_message(session, concerts, sender, context, msg)
  p "GENERIC"
  p context
  queries = session.queries.map{|q| q.attr}

  structured_reply = GenericTemplate.new
  if concerts.length < 9
    less_than_9_concerts(session, concerts, sender, structured_reply)
  else
    concerts_showed = context["concerts_showed"] * 9
    concerts_left = concerts.count - (context["concerts_showed"] * 9)
    if concerts_left > 9
      more_than_9_concerts_left(concerts, session, concerts_showed, structured_reply)
    elsif concerts_left > 0
      less_than_9_concerts_left(concerts, session, concerts_showed, structured_reply)
    end
    sender.reply(structured_reply.get_message)
    transfer_middle_office(session.id, sender, structured_reply.get_message)
    p "ENVOYE"
  end
end


# Method for displaying the description of a specific concert

def more_info_message(concert, sender)
  p "MORE INFO"
  p concert
  infos = ActionView::Base.full_sanitizer.sanitize(concert["concert"]["body_html"])
  structured_reply = ButtonTemplate.new
  structured_reply.set_text(infos)
  structured_reply.add_postback("Check stock", "#{concert["concert"]["id"]}: stock")
  structured_reply.add_postback("More pictures", "#{concert["concert"]["id"]}: pictures")
  reply_transfer(session, sender, structured_reply)
end

# Method for displaying a carousel of all the images of a specific concert


def more_pictures_message(concert, sender)
  structured_reply = GenericTemplate.new
  concert["concert"]["images"].each do |image|
      more_info_button = Button.new
      more_info_button.add_postback("More info","#{concert["concert"]["id"]}: info")
      check_stock_button = Button.new
      check_stock_button.add_postback("Check stock","#{concert["concert"]["id"]}: stock")
      structured_reply.add_element("Detailed images", "", image["src"], "", [more_info_button.get_message, check_stock_button.get_message ] )
  end
  reply_transfer(session, sender, structured_reply)
end

