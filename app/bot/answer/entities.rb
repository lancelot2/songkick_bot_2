def entities(session, username, sender, msg= "", parameter)
  context = session.context
  if context["intent"] == parameter && context[parameter].present?
    query = Query.create(session_id: session.id, attr: "vendor", value: context[parameter])
    products = run_query(session, msg)
    context["products_showed"] = 0
    session.update(context: context)
    generic_template_message(session, products, sender, increase_context(session).context, msg)
  elsif context["intent"] == parameter
    cta_brands_message(sender)
  end
end
