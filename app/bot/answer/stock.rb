def stock(session, username, sender, msg= "")
  context = session.context
  if context["intent"] == "stock" && context["pricerange"].present? || context["intent"] == "stock" && context["style"].present? || context["intent"] == "stock" && context["brand"].present?
    get_stock(session,sender)
  end
end
