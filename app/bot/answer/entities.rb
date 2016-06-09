def entity(session, username, sender, msg= "", parameter)
  context = session.context
  if context["intent"] == "city" && context["city"].present?
    #query = Query.create(session_id: session.id, attr: parameter, value: context[parameter])
    # context["concerts_showed"] = 0
    # session.update(context: context)
    # venues_or_upcoming(session, sender)
    #send("city", session, sender, msg)
  elsif context["intent"] == parameter && context[parameter].present?
      #query = Query.create(session_id: session.id, attr: parameter, value: context[parameter])
      context["concerts_showed"] = 0
      session.update(context: context)
      #products = run_query(session, msg)
      send(context[parameter], sender)
    elsif context["intent"] == parameter
      send(parameter, sender)
    end
end

# def area_entity(session, username, sender, msg= "", parameter)
#   context = session.context
#   send(parameter, sender)
# end
