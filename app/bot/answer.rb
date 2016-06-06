def answer(session, username, sender, msg = "")
  context = session.context
  navigation(session, username, sender, msg)
  # Call relevant methods
end
