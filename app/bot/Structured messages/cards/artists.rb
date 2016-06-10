def add_artist_card(page, structured_reply)
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


def send_artists(session, sender)
  context = session.context
  structured_reply = GenericTemplate.new

  reply_transfer(session, sender, structured_reply)
  a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Mac Safari'
  }
  a.get("http://www.songkick.com/leaderboards/#{context['intent']}") do |page|
    p name = page.search(".leaderboard tr")[1..9][0].search(".name a").first.text
    p image = "http:" + page.search(".leaderboard tr")[1..9][0].search(".profile-image img").first.attr("src")
    artist_biography_button = Button.new
    artist_biography_button.add_postback("Check details","details")
    artist_upcoming_concerts_button = Button.new
    artist_upcoming_concerts_button.add_postback("Upcoming concerts","upcoming")
    live_reviews_button = Button.new
    live_reviews_button.add_postback("Live reviews","reviews")
    structured_reply.add_element(name, "", image, "", [artist_upcoming_concerts_button.get_message, artist_biography_button.get_message, live_reviews_button.get_message] )

    # artist_biography_button = Button.new
    # artist_biography_button.add_postback("Check details", "iD: artist_biography")
    # live_reviews_button = Button.new
    # live_reviews_button.add_postback("Live Reviews", "iD: live_reviews")
    # artist_upcoming_concerts_button = Button.new
    # artist_upcoming_concerts_button.add_postback("Upcoming concerts", "iD: artist_upcoming_concerts")
    #structured_reply.add_element(name, "", image, "", [artist_biography_button.get_message, live_reviews_button.get_message, artist_upcoming_concerts_button.get_message])
  end
  p structured_reply.get_message
  sender.reply(structured_reply.get_message)
end
