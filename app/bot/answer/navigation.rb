def navigation(session, username, sender, msg = "")
  context = session.context
  if context["intent"].nil?
    sender.reply({text: t('navigation-intro-1', username: username)})
    transfer_middle_office(session.id, sender, "hey")
    sleep(3)
    sender.reply({text: t('navigation-intro-2')})
    transfer_middle_office(session.id, sender, "hey")
    sleep(3)
    sender.reply({text: t('navigation-intro-3')})
    transfer_middle_office(session.id, sender, "hey")
    sleep(3)
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
  # elsif context["intent"] == "exit"
  #   context = {}
  #   session.update(context: context)
  #   sender.reply({text: t('exit-requested', username: username)})
  #   transfer_middle_office(session.id, sender, t('exit-requested'))
  #   ImageTemplate.new(url='http://res.cloudinary.com/dpy7x8rgs/image/upload/v1465372198/SongKick/GIF/bye_rihanna.gif')
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
  elsif context["intent"] == "venue"
    show_venues(session, sender)
  elsif context["intent"] == "upcoming"
    city(session, sender, msg)
  elsif context["intent"] == "city" && context["city"].present?
    venues_or_upcoming(session, sender)
    # p "GET VENUES"
    # p context
    # choose_location(session, sender)
  end
end

