def entity(session, username, sender, msg= "", parameter)
  context = session.context
  if context["intent"] == "city" && context["city"].present?
    #query = Query.create(session_id: session.id, attr: parameter, value: context[parameter])
    context["concerts_showed"] = 0
    session.update(context: context)
    # venues_or_upcoming(session, sender)
    #send("city", session, sender, msg)
  elsif context["intent"] == parameter && context[parameter].present?
      #query = Query.create(session_id: session.id, attr: parameter, value: context[parameter])
      context["concerts_showed"] = 0
      session.update(context: context)
      #products = run_query(session, msg)
      send(context[parameter], session, sender)
  elsif context["intent"] == "country"
    previous_session = Session.where(facebook_id: session.facebook_id).last(2).first
    if previous_session.nil? == false && previous_session.context["city"].present? && session.count < 5
      structured_reply = ButtonTemplate.new
      structured_reply.set_text("Are you still in #{previous_session.context['city'].capitalize} ?")
      structured_reply.add_postback("Yes", previous_session.context["city"])
      structured_reply.add_postback("No", "no")
      reply_transfer(session, sender, structured_reply)
    else
      p "COUNT"
      p session.count
      if session.count < 6
        send("country", session, sender, msg)
      end
    end
  elsif context["intent"] == parameter
    send(parameter, session, sender, msg)
  end
end

# def area_entity(session, username, sender, msg= "", parameter)
#   context = session.context
#   send(parameter, sender)
# end
