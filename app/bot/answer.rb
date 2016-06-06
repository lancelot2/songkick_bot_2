def answer(session, username, sender, msg = "")
  context = session.context
  navigation(session, username, sender, msg)
  entities(session, username, sender, msg, entity)
  if session.context["intent"] == "yes" && context.size > 1
    analyse_yes(msg, session, sender)
  elsif session.context["intent"] == "no" && context.size > 1
    analyse_no(msg, session, sender)
  end
end

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


def product(session, username, sender, msg = "")
  context = session.context
  if context["intent"] == "info"
    product = Oj.load(RestClient.get "https://#{ENV['shopify_token']}@myshopifybot.myshopify.com/admin/products/#{context['product_id']}.json?fields=body_html,id")
    more_info_message(product, sender)
  elsif context["intent"] == "viewmore"
    if context["previous_intent"] == "categories"
      context["intent"] = "categories"
      session.update(context: context)
      categories(session, username, sender, msg)
    elsif context["previous_intent"] == "brands"
      context["intent"] = "brands"
      session.update(context: context)
      brand(session, username, sender, msg)
    end
  elsif context["intent"] == "pictures"
    p "PICTURES"
    product = Oj.load(RestClient.get "https://#{ENV['shopify_token']}@myshopifybot.myshopify.com/admin/products/#{context['product_id']}.json?fields=images,id")
    more_pictures_message(product, sender)
  end
end

def entities(session, username, sender, msg= "", entity)
  context = session.context
  if context["intent"] == "entity" && context["entity"].present?
    query = Query.create(session_id: session.id, attr: "entity", value: context["entity"])
    products = run_query(session, msg)
    context["products_showed"] = 0
    session.update(context: context)
    generic_template_message(session, products, sender, increase_context(session).context, msg)
  elsif context["intent"] == "entity"
    cta_pricerange_message(sender)
  end
end

def run_query(session, msg= "")
  url = "https://#{ENV['shopify_token']}@myshopifybot.myshopify.com/admin/products.json?"
  queries = session.queries.map{|q| q.attr}
  p "RUN QUERY"
  p session.context
  session.queries.each do |query|
    unless query.attr == "pricerange"
      url = url + query.attr + "=" + query.value + "&"
    end
  end
  products = Oj.load(RestClient.get url)
  if queries.include? "pricerange"
    products = filter_products_by_price(session, msg, products)
  end
  products
end

def store(session, username, sender, msg = "")
  context = session.context
  if context["intent"] == "chosen"
    #Purchase.create(order_id: session.order_id, item_id: context["product_id"])
    sender.reply({text: "Thanks for your purchase ! Here is your receipt:"})
    store_receipt(sender, session)
    sleep(3)
    sender.reply({text: "If ever we are missing something, one of our agents will be in touch with you"})
    sleep(2)
    cta_restart_message(session, sender)
  # if context["intent"] == "chosen"
  #   store = Store.find(context["store_id"].to_i)
  #   product = Oj.load(RestClient.get "https://#{ENV['shopify_token']}@myshopifybot.myshopify.com/admin/products/#{context['product_id']}.json?")
  #   sender.reply({text: "Thanks for your purchase! Here is your receipt:"})
  #   store_receipt(product, sender, store, session)
  #   sleep(3)
  #   sender.reply({text: "If ever we are missing something, one of our agents will be in touch with you"})
  #   cta_restart_message(sender)
  elsif context["intent"] == "pickup"
    Purchase.create(order_id: session.order_id, item_id: context["product_id"])
    checkout_or_browse(session, sender)
    context["products_showed"] = 0
    session.update(context: context)
    # cta_delivery_message(sender)
    # context["intent"] = "store_registration"
  elsif context["intent"] == "venue_search"
    sender.reply({text: "Just share your location with me and I will list the closest venues."})
    transfer_middle_office(session.id, sender, "Just share your location with me and I will list the closest venues.")
  end
end

def navigation(session, username, sender, msg = "")
  context = session.context
  if context["intent"].nil?
    sender.reply({text: "Hi, #{username}, Welcome to SongKick bot !!"})
    transfer_middle_office(session.id, sender, "Hi, #{username}, Welcome to SongKick bot !!")
    sleep(3)
    sender.reply({text: "It is the easiest way to checkout gigs happening around you"})
    transfer_middle_office(session.id, sender, "It is the easiest way to checkout gigs happening around you")
    sleep(3)
    sender.reply({text: "If you feel lucky, try to type directly your city, a venue or an artist. ;-)"})
    transfer_middle_office(session.id, sender, "If you feel lucky, try to type directly your city, a venue or an artist. ;-)")
    sleep(10)
    cta_intent_message(session, sender)
  elsif context["intent"] == "stop"
    sender.reply({text: "Ok, what can I do for you then ?"})
    transfer_middle_office(session.id, sender, "Ok, what can I do for you then ?")
  elsif context["intent"] == "help"
    session.update(status: "human")
    sender.reply({text: "A human operator will take it from here. It might take a few minutes. Feel free to type what you're looking for"})
    transfer_middle_office(session.id, sender, "A human operator will take it from here. It might take a few minutes. Feel free to type what you're looking for")
   help_request(username)
  elsif context["intent"] == "exit"
    context = {}
    session.update(context: context)
    sender.reply({text: "It was a pleasure talking to you. Have a nice day #{username} ! :* "})
    transfer_middle_office(session.id, sender, "It was a pleasure talking to you. Have a nice day #{username} ! :* ")
  elsif context["intent"] == "restart"
    sender.reply({text: "Roger that ! If ever we are missing something, one of our agents will be in touch with you"})
    transfer_middle_office(session.id, sender, "Roger that ! If ever we are missing something, one of our agents will be in touch with you")
    cta_restart_message(session, sender)
  elsif session.context["intent"] == "lost"
    sender.reply({text: "Please hold on a few seconds, while I analyse your last message."})
    transfer_middle_office(session.id, sender, "Please hold on a few seconds, while I analyse your last message.")
  elsif context["intent"] == "mainbrowsing"
    context = {}
    cta_intent_message(session, sender)
  elsif context["intent"] == "filtered"
    context = {}
    cta_intent_message(session, sender)
  elsif context["intent"] == "continue"
    previous_context = context.clone
    context = {}
    if previous_context["pricerange"].present?
      context["pricerange"] = previous_context["pricerange"]
    end
    context["intent"] = "start"
    session.update(context: context)
    cta_intent_message(session, sender)
  elsif context["intent"] == "checkout"
    cta_delivery_message(sender)
  end
end

def transfer_middle_office(session_id, username, sender, msg = "")
  p session_id
  p msg
  session = Session.find(session_id)
  sender_id = session.facebook_id
  p "MIDDLE"
  # username = sender.get_profile[:body]["first_name"]
  # profile_picture = {profile_pic: (sender.get_profile[:body]["profile_pic"])}.to_query
  # p msg
  # url = "https://mymessagingstore.herokuapp.com/api/v1/sessions?fbid=#{sender_id}&msg=#{msg}&first_name=#{username}&sender=bot&context=#{session.context}&#{profile_picture}"
  # RestClient.post URI.encode(url), :content_type => :json, :accept => :json
end

def reply_transfer(session, sender, structured_reply)
  username = sender.get_profile[:body]["first_name"]
  sender.reply(structured_reply.get_message)
  transfer_middle_office(session.id, username, sender, structured_reply.get_message)
end
