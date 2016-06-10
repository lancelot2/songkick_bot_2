def increase_context(session)
  context = session.context.clone
  if context["concerts_showed"].nil? || context["concerts_showed"] == 0
    context["concerts_showed"] = 0
  else
   context["concerts_showed"] += 1
  end
  session.update(context: context)
  p context
  session
end
