def navigation(session, username, sender, msg = "")
  context = session.context
  if context["intent"] == "start"
    sender.reply({text: t('navigation-intro-1', username: username)})
    transfer_middle_office(session.id, sender, t('navigation-intro-1', username: username)), "bot")
    sleep(3)
    sender.reply({text: t('navigation-intro-2')})
    transfer_middle_office(session.id, sender, t('navigation-intro-2'), "bot")
    sleep(3)
    # sender.reply({text: t('navigation-intro-3')})
    # transfer_middle_office(session.id, sender, "hey")
    # sleep(3)
    cta_intent_message(session, sender)
  # elsif context["intent"] == "start"
  #   sender.reply({text: t('navigation-start-validation')})
  #   transfer_middle_office(session.id, sender, t('navigation-start-validation'))
  #   cta_intent_message(session, sender)
  # elsif context["intent"] == "stop"
  #   sender.reply({text: t('stop')})
  #   transfer_middle_office(session.id, sender, t('stop'))
  # elsif context["intent"] == "help"
  #   session.update(status: "human")
  #   sender.reply({text: t('human-assistance-requested')})
  #   transfer_middle_office(session.id, sender, t('human-assistance-requested'))
  #  help_request(username)
  elsif context["intent"] == "exit"
    context = {}
    session.update(context: context)
    sender.reply({text: t('exit-requested', username: username)})
    transfer_middle_office(session.id, sender, t('exit-requested'), "bot")
    gifs = ['http://res.cloudinary.com/dpy7x8rgs/image/upload/v1465372198/SongKick/GIF/bye_rihanna.gif', 'http://res.cloudinary.com/dpy7x8rgs/image/upload/v1465372192/SongKick/GIF/bye_christine_and_the_queens.gif', 'http://res.cloudinary.com/dpy7x8rgs/image/upload/v1465372187/SongKick/GIF/bye_one_direction.gif', 'http://res.cloudinary.com/dpy7x8rgs/image/upload/v1465372168/SongKick/GIF/bye_amy.gif', 'http://res.cloudinary.com/dpy7x8rgs/image/upload/v1465372193/SongKick/GIF/bye_britney.gif']
    gif = ImageTemplate.new(gifs.sample)
    sender.reply(gif.get_message)
  # elsif context["intent"] == "restart"
  #   sender.reply({text: t('restart-requested')})
  #   transfer_middle_office(session.id, sender, t('restart-requested'))
  #   cta_restart_message(sender)
  # elsif session.context["intent"] == "lost"
  #   sender.reply({text: t('lost')})
  #   transfer_middle_office(session.id, sender, t('lost'))
  # elsif context["intent"] == "mainbrowsing"
  #   context = {}
  #   cta_intent_message(session, sender)
  elsif context["intent"] == "single_card"
    single_card(session, sender)
  elsif context["intent"] == "city" && context["country"].present? && context["city"].present?
    city(session, sender, msg)
  elsif context["intent"] == "reviews"
    send_artists_reviews_details(session, sender)
  elsif context["intent"] == "details"
    send_artists_reviews_details(session, sender)
  elsif context["intent"] == "popular_artists" && context["artist_url"].nil? || context["intent"] == "trending_artists" && context["artist_url"].nil?
    send_artists(session, sender)
  elsif context["intent"] == "geolocated"
    geo_loc = "http://api.songkick.com/api/3.0/search/locations.json?location=geo:#{context['lat']},#{context['lng']}&apikey=h76Z5PDgOid28Zly"
    context["city"] =  Oj.load(RestClient.get geo_loc, :content_type => :json, :accept => :json)["resultsPage"]["results"]["location"][0]["metroArea"]["displayName"]
    session.update(context: context)
    venues_or_upcoming(session, sender)
  elsif context["intent"] == "venue"
    show_venues(session, sender)
  elsif context["intent"] == "upcoming" && context["artist_id"].present?
    artist_url = "http://api.songkick.com/api/3.0/artists/#{context['artist_id']}/calendar.json?apikey=h76Z5PDgOid28Zly"
    concerts =  Oj.load(RestClient.get artist_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"]
    increase_context(session)
    context["concerts_showed"] = 0
    session.update(context: context)
    generic_template_message(session, concerts, sender, context, msg)
  elsif context["intent"] == "upcoming"
    city(session, sender, msg)
  # elsif context["intent"] == "city" && context["city"].present?
  #   venues_or_upcoming(session, sender)
  elsif context["intent"] == "show_concerts"
    concert_url = "http://api.songkick.com/api/3.0/venues/#{context["venue_id"]}/calendar.json?apikey=h76Z5PDgOid28Zly"
    concerts =  Oj.load(RestClient.get concert_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"]
    generic_template_message(session, concerts, sender, context, msg)
  elsif context["intent"] == "city" && context["city"].present?
    venues_or_upcoming(session, sender)
    #city(session, sender, msg)
    # p context
    # choose_location(session, sender)
  end
end

