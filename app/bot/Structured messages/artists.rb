# Method of allowing the user to pick between 2 different of listings

def cta_artists_message(sender)
  structured_reply = ButtonTemplate.new
  structured_reply.set_text("How do you want to list them ?")
  structured_reply.add_postback("Most popular", "popularity")
  structured_reply.add_postback("Trending artists", "trending")
  reply_transfer(session, sender, structured_reply)
end

# def filter_products_by_price(session, msg, products)
#   products_filtered = []
#   context = session.context
#   keywords = [["less20", 0, 20],["20to50", 20, 50], ["more50", 50, 1000]]
#   tokenized_array = msg.downcase.split
#   keywords.each do |array|
#     if (tokenized_array & array).any?
#       context["pricerange"] = array.first
#       context["pricemin"] = array[1]
#       context["pricemax"] = array[2]
#     end
#   end

#   session.update(context: context)
#   products["products"].each_with_index do |product, index|
#     unless (product["variants"].first["price"].to_i < context["pricemax"])  && (product["variants"].first["price"].to_i > context["pricemin"])
#      products["products"].delete(product)
#     end
#   end
#   products
# end
# Method for displaying a carousel of product according to a specific price range

def price_filtered_message(products, sender, min, max)
  structured_reply = GenericTemplate.new

  counter = 0
  products["products"].each do |product|
    counter += 1
    unless counter > 9
      if (product["variants"].first["price"].to_i < max.to_i)  && (product["variants"].first["price"].to_i > min.to_i)
        info_button = Button.new
        info_button.add_postback("More info", "#{product["id"]}: info")

        stock_button = Button.new
        stock_button.add_postback("Check stock", "#{product["id"]}: stock")

        structured_reply.add_element(product["title"], "", product["images"].first["src"], "#{product["variants"].first["price"]}$", [info_button.get_message, stock_button.get_message])
      end
    end
  end
  reply_transfer(session, sender, structured_reply)
end

