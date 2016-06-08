def add_venue_card(concert, structured_reply)
    artist_page_url = concert["performance"].first["artist"]["uri"]
    concert_name = concert["displayName"]
    concert_date = concert["start"]["datetime"]
    venue_name = concert["venue"]["displayName"]
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    a.get(concert["performance"].first["artist"]["uri"]) do |page|
      image_url =  "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
      info_button = Button.new
      info_button.add_postback("Check details", "iD: venue_details")
      stock_button = Button.new
      stock_button.add_postback("Upcoming concerts", "iD: venue_upcoming_concerts")
      structured_reply.add_element(concert_name, "", image_url, concert_date, [venue_details_button.get_message, venue_upcoming_concerts_button.get_message])
    end

  structured_reply
end
