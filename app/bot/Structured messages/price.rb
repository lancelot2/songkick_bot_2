# Method of allowing the user to pick between 3 different price ranges

def cta_pricerange_message(sender)
  structured_reply = {
    "attachment":{
      "type":"template",
      "payload":{
        "template_type":"button",
        "text":"So what is your budget ?",
        "buttons":[
          {
            "type":"postback",
            "title":"Less than 20 euros",
            "payload":"less20"
          },
          {
            "type":"postback",
            "title":"From 20 to 50 euros",
            "payload":"20to50"
          },
          {
            "type":"postback",
            "title":"More than 50 euros",
            "payload":"more50"
          }
        ]
      }
    }
  }
  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end

def filter_products_by_price(session, msg, products)
  products_filtered = []
  context = session.context
  keywords = [["less20", 0, 20],["20to50", 20, 50], ["more50", 50, 1000]]
  tokenized_array = msg.downcase.split
  keywords.each do |array|
    if (tokenized_array & array).any?
      context["pricerange"] = array.first
      context["pricemin"] = array[1]
      context["pricemax"] = array[2]
    end
  end

  session.update(context: context)
  products["products"].each_with_index do |product, index|
    unless (product["variants"].first["price"].to_i < context["pricemax"])  && (product["variants"].first["price"].to_i > context["pricemin"])
     products["products"].delete(product)
    end
  end
  products
end
# Method for displaying a carousel of product according to a specific price range

def price_filtered_message(products, sender, min, max)
  structured_reply = {
    "attachment":{
      "type": "template",
      "payload":{
        "template_type": "generic",
        "elements": []
      }
    }
  }

  counter = 0
  products["products"].each do |product|
    counter += 1
    unless counter > 9
      if (product["variants"].first["price"].to_i < max.to_i)  && (product["variants"].first["price"].to_i > min.to_i)
        structured_reply[:attachment][:payload][:elements] <<
          { "title": product["title"],
            "image_url": product["images"].first["src"],
            "subtitle": "#{product["variants"].first["price"]}$",
            "buttons":[
              {
                "type":"postback",
                "payload": "#{product["id"]}: info",
                "title":"More info"
              },
              {
                "type":"postback",
                "payload": "#{product["id"]}: stock",
                "title":"Check stock"
              }
            ]
          }
      end
    end
  end
  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end

