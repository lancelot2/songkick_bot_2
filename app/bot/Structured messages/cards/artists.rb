def add_artist_card(artist, structured_reply)
    artist_name = artist["displayName"]
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    a.get(artist["uri"]) do |page|
      image_url =  "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
      artist_biography = Button.new
      artist_biography.add_postback("Check details", "iD: artist_biography")
      live_reviews = Button.new
      live_reviews.add_postback("Live Reviews", "iD: live_reviews")
      artist_upcoming_concerts = Button.new
      artist_upcoming_concerts.add_postback("Upcoming concerts", "iD: artist_upcoming_concerts")
      structured_reply.add_element(artist_name, "", image_url, "", [artist_biography_button.get_message, live_reviews_button.get_message, artist_upcoming_concerts_button.get_message])
    end

  structured_reply
end
