def add_artist_card(page, structured_reply)
    artist_name = artist["displayName"]
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    a.get(artist["uri"]) do |page|
      image_url =  "http:" + page.search(".profile-picture-wrap img").first.attr("src")
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
    artists_total = page.search(".leaderboard tr").count
    artists_showed = context["artists_showed"].to_i * 9
    artists_left = artists_total - artists_showed
    if artists_total < 9
      page.search(".leaderboard tr")[1..10].each do |artist|
        p name = artist.search(".name a").first.text
        p id = artist.search(".name a").first.attr("href").gsub("/artists/", "").gsub("-#{name.downcase}", "")
        p image = "http:" + artist.search(".profile-image img").first.attr("src")
        # url = "http://www.songkick.com/" + artist.search(".name a").first.attr("href")
        # context["artist_url"] = url
        session.update(context: context)
        artist_biography_button = Button.new
        artist_biography_button.add_postback("Check details","details :#{id} #{name}")
        artist_upcoming_concerts_button = Button.new
        artist_upcoming_concerts_button.add_postback("Upcoming concerts","upcoming :#{id}")
        live_reviews_button = Button.new
        live_reviews_button.add_postback("Live reviews","reviews :#{id}")
        structured_reply.add_element(name, "", image, "", [artist_upcoming_concerts_button.get_message, artist_biography_button.get_message, live_reviews_button.get_message] )
      end
    else
      if artists_left > 9
         page.search(".leaderboard tr")[(artists_showed + 1)..(artists_showed + 9)].each do |artist|
          p name = artist.search(".name a").first.text
          p id = artist.search(".name a").first.attr("href").gsub("/artists/", "").gsub("-#{name.downcase}", "")
          p image = "http:" + artist.search(".profile-image img").first.attr("src")
          # url = "http://www.songkick.com/" + artist.search(".name a").first.attr("href")
          # context["artist_url"] = url
          session.update(context: context)
          artist_biography_button = Button.new
          artist_biography_button.add_postback("Check details","details :#{id} #{name}")
          artist_upcoming_concerts_button = Button.new
          artist_upcoming_concerts_button.add_postback("Upcoming concerts","upcoming :#{id}")
          live_reviews_button = Button.new
          live_reviews_button.add_postback("Live reviews","reviews :#{id}")
          structured_reply.add_element(name, "", image, "", [artist_upcoming_concerts_button.get_message, artist_biography_button.get_message, live_reviews_button.get_message] )
        end
          browsing_cards = ['http://res.cloudinary.com/dltbqhact/image/upload/v1466604495/Browse%20more/Lego/vador-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466604807/Browse%20more/Lego/runner-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605432/Browse%20more/Lego/harry-potter-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605432/Browse%20more/Lego/police-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605431/Browse%20more/Lego/picasso-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605431/Browse%20more/Lego/kid-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605430/Browse%20more/Lego/professor-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605429/Browse%20more/Lego/flash-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605431/Browse%20more/Lego/business-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605433/Browse%20more/Lego/dandy-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605428/Browse%20more/Lego/doctor-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605431/Browse%20more/Lego/explorer-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605428/Browse%20more/Lego/merlin-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605431/Browse%20more/Lego/mexican-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605427/Browse%20more/Lego/constructor-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605427/Browse%20more/Lego/boxing-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605423/Browse%20more/Lego/space-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605423/Browse%20more/Lego/space-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605422/Browse%20more/Lego/sherif-card.png', 'http://res.cloudinary.com/dltbqhact/image/upload/v1466605422/Browse%20more/Lego/scoubidou-card.png']
          viewmore_button = Button.new
          viewmore_button.add_postback("View more","viewmore")
          structured_reply.add_element("View more", "", browsing_cards.sample, "", [viewmore_button.get_message] )
      elsif artists_left > 0
        page.search(".leaderboard tr")[(artists_showed + 1)..(artists_showed + 8)].each do |artist|
          p name = artist.search(".name a").first.text
          p id = artist.search(".name a").first.attr("href").gsub("/artists/", "").gsub(/[^\d]/, '')
          p image = "http:" + artist.search(".profile-image img").first.attr("src")
          # url = "http://www.songkick.com/" + artist.search(".name a").first.attr("href")
          # context["artist_url"] = url
          session.update(context: context)
          artist_biography_button = Button.new
          artist_biography_button.add_postback("Check details","details :#{id} #{name}")
          artist_upcoming_concerts_button = Button.new
          artist_upcoming_concerts_button.add_postback("Upcoming concerts","upcoming :#{id}")
          live_reviews_button = Button.new
          live_reviews_button.add_postback("Live reviews","reviews :#{id}")
          structured_reply.add_element(name, "", image, "", [artist_upcoming_concerts_button.get_message, artist_biography_button.get_message, live_reviews_button.get_message] )
        end
      end
    end
  end
  p structured_reply.get_message
  sender.reply(structured_reply.get_message)
end

# def less_than_9_artists(session, sender, structured_reply)

# end


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


def single_card(session, sender)
  context = session.context
  structured_reply = GenericTemplate.new
  a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Mac Safari'
  }
  if context["artist_url"].present? && context["intent"] == "artist_search"
    a.get(context["artist_url"]) do |page|
      artist_name = page.search("h1").text
      image_url =  "http:" + page.search(".profile-picture-wrap img").first.attr("src")
      id = context["artist_url"].gsub("http://www.songkick.com/artists/", "")[/\d+/]
      artist_upcoming_concerts_button = Button.new
      artist_upcoming_concerts_button.add_postback("Upcoming concerts","upcoming :#{id}")
      artist_biography_button = Button.new
      artist_biography_button.add_postback("Check details","details :#{id}")
      live_reviews_button = Button.new
      live_reviews_button.add_postback("Live reviews","reviews :#{id}")
      structured_reply.add_element(artist_name, "", image_url, "", [artist_upcoming_concerts_button.get_message, artist_biography_button.get_message, live_reviews_button.get_message] )
    end
    sender.reply(structured_reply.get_message)
  elsif context["artist_url"].present? && context["venue_url"].nil?
    a.get(context["artist_url"]) do |page|
      artist_name = page.search("h1").text
      image_url =  "http:" + page.search(".profile-picture-wrap img").first.attr("src")
      id = context["artist_url"].gsub("http://www.songkick.com/artists/", "")[/\d+/]
      artist_biography_button = Button.new
      artist_biography_button.add_postback("Check details","details :#{id}")
      live_reviews_button = Button.new
      live_reviews_button.add_postback("Live reviews","reviews :#{id}")
      structured_reply.add_element(artist_name, "", image_url, "", [artist_biography_button.get_message, live_reviews_button.get_message] )
    end
    sender.reply(structured_reply.get_message)
  elsif context["venue_url"].present?
    a.get(context["venue_url"]) do |page|
      image_url = "http:" + page.search(".profile-picture").attr("src").value
      id = context["venue_url"].gsub("http://www.songkick.com/venues/", "")[/\d+/]
      context["venue_id"] = id
      session.update(context: context)
      venue_name = page.search("h1").first.children.first.text
      upcoming_concerts_button = Button.new
      upcoming_concerts_button.add_postback("See concerts","upcoming :#{id}")
      structured_reply.add_element(venue_name, "", image_url, "", [upcoming_concerts_button.get_message])
    end
    sender.reply(structured_reply.get_message)
  end
end
