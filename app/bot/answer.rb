def answer(session, username, sender, msg = "")
  context = session.context
  navigation(session, username, sender, msg)
  entity(session, username, sender, msg, "artists")
  entity(session, username, sender, msg, "venues")
  entity(session, username, sender, msg, "usa")
  entity(session, username, sender, msg, "uk")
  entity(session, username, sender, msg, "europe")
  area_entity(session, username, sender, msg, "country")
  product(session, username, sender, msg)
  if session.context["intent"] == "yes" && context.size > 1
    analyse_yes(msg, session, sender)
  elsif session.context["intent"] == "no" && context.size > 1
    analyse_no(msg, session, sender)
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
 # products = Oj.load(RestClient.get url)
  if queries.include? "pricerange"
    products = filter_products_by_price(session, msg, products)
  end
  products
end


def reply_transfer(session, sender, structured_reply)
  username = sender.get_profile[:body]["first_name"]
  sender.reply(structured_reply.get_message)
  transfer_middle_office(session.id, sender, structured_reply.get_message)
end
