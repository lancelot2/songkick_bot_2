def entity(session, username, sender, msg= "", parameter)
  context = session.context
    if context["intent"] == parameter && context[parameter].present?
      query = Query.create(session_id: session.id, attr: parameter, value: context[parameter])
      context["products_showed"] = 0
      session.update(context: context)
      products = run_query(session, msg)
      generic_template_message(session, products, sender, increase_context(session).context, msg)
    elsif context["intent"] == parameter
      send(parameter, sender)
    end
end


def area_entity(session, username, sender, msg= "", parameter)
  context = session.context
  send(parameter, sender)
end
