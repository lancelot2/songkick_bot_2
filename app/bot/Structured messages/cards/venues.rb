def add_venue_card(venue, structured_reply)
    venue_name = venue["displayName"]
    venue_address = venue["street"] + venue["zipcode"]
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    a.get(venue["uri"]) do |page|
      image_url =  "http:" + page.search(".profile-picture")[10].attributes["src"].value
      venue_details = Button.new
      venue_details.add_postback("Check details", "iD: venue_details")
      venue_upcoming_concerts = Button.new
      venue_upcoming_concerts.add_postback("Upcoming concerts", "iD: venue_upcoming_concerts")
      structured_reply.add_element(venue_name, "", image_url, venue_address, [venue_details_button.get_message, venue_upcoming_concerts_button.get_message])
    end

  structured_reply
end
