def increase_context(session)
  context = session.context.clone
  if context["products_showed"].nil? || context["products_showed"] == 0
    context["products_showed"] = 0
  else
   context["products_showed"] += 1
  end
  session.update(context: context)
  session
end
