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
    page.search(".leaderboard tr")[1..9].each do |artist|
      p name = artist.search(".name a").first.text
      p id = page.search(".leaderboard tr")[1..10][0].search(".name a").first.attr("href").gsub("/artists/", "").gsub("-#{name.downcase}", "")
      p image = "http:" + artist.search(".profile-image img").first.attr("src")
      url = "http://www.songkick.com/" + page.search(".leaderboard tr")[1..10][0].search(".name a").first.attr("href")
      context["artist_url"] = url
      session.update(context: context)
      artist_biography_button = Button.new
      artist_biography_button.add_postback("Check details","details :#{id}")
      artist_upcoming_concerts_button = Button.new
      artist_upcoming_concerts_button.add_postback("Upcoming concerts","upcoming :#{id}")
      live_reviews_button = Button.new
      live_reviews_button.add_postback("Live reviews","reviews :#{id}")
      structured_reply.add_element(name, "", image, "", [artist_upcoming_concerts_button.get_message, artist_biography_button.get_message, live_reviews_button.get_message] )
    end
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


def send_artists_reviews_details(session, sender)
  context = session.context
  a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Mac Safari'
  }
  if context["intent"] == "reviews"
    reviews = []
    a.get(context["artist_url"]) do |page|
      page.search(".artist-reviews ul li")[0..5].each do |review|
        reviews << review.search(".review-content p").first.text
      end
    end
    if reviews.empty?
      sender.reply({text: "Sorry there aren't any reviews yet :( "})
    else
      reviews.each do |review|
        sender.reply({text: review})
      end
    end
  elsif context["intent"] == "details"
    a.get(context["artist_url"]) do |page|
      bio = page.search("#biography .standfirst p").text
      if bio.empty?
        sender.reply({text: "Sorry this artists biography hasn't been added yet :("})
      else
        sender.reply({text: bio})
      end
    end
  end
end
