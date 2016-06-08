def add_venue_card(concert, structured_reply)
    concert["performance"].first["artist"]["uri"]
    concert["displayName"]
    concert["venue"]["displayName"]
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    a.get(concert["performance"].first["artist"]["uri"]) do |page|
      image_url =  "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
      date = concert["start"]["datetime"]
      info_button = Button.new
      info_button.add_postback("Check details", "iD: info")
      stock_button = Button.new
      stock_button.add_postback("Upcoming concerts", "iD: stock")
      structured_reply.add_element(concert["displayName"], "", image_url, date, [info_button.get_message, pictures_button.get_message, stock_button.get_message])
    end

  structured_reply
end
