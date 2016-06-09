def answer(session, username, sender, msg = "")
  context = session.context
  entity(session, username, sender, msg, "city")
  entity(session, username, sender, msg, "country")
  navigation(session, username, sender, msg)
end

def reply_transfer(session, sender, structured_reply)
  username = sender.get_profile[:body]["first_name"]
  sender.reply(structured_reply.get_message)
  transfer_middle_office(session.id, sender, structured_reply.get_message)
end


# def run_query(session, msg= "")
#   url = "https://#{ENV['shopify_token']}@myshopifybot.myshopify.com/admin/products.json?"
#   queries = session.queries.map{|q| q.attr}
#   p "RUN QUERY"
#   p session.context
#   session.queries.each do |query|
#     unless query.attr == "pricerange"
#       url = url + query.attr + "=" + query.value + "&"
#     end
#   end
#  # products = Oj.load(RestClient.get url)
#   if queries.include? "pricerange"
#     products = filter_products_by_price(session, msg, products)
#   end
#   products
# end
