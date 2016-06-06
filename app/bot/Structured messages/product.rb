def last_card(session, structured_reply, counter)
  context = session.context
  queries = session.queries.map{|q| q.attr}

  if (queries.include? "product_type") && (queries.include? "vendor")
    structured_reply[:attachment][:payload][:elements] << {
      "title":"See more products",
      "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png",
      "buttons":[
        {
          "type":"postback",
          "payload": "viewmore",
          "title":"View more"
        },
        {
          "type":"postback",
          "payload": "pricerange",
          "title": "Filter price"
        }
      ]
    }
  elsif (queries.include? "product_type") && (queries.include? "pricerange")
    structured_reply[:attachment][:payload][:elements] << {
      "title":"See more products",
      "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png",
      "buttons":[
        {
          "type":"postback",
          "payload": "viewmore",
          "title":"View more"
        },
        {
          "type":"postback",
          "payload": "brands",
          "title": "Filter brands"
        }
      ]
    }
  elsif (queries.include? "vendor") && (queries.include? "pricerange")
    structured_reply[:attachment][:payload][:elements] << {
      "title":"See more products",
      "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png",
      "buttons":[
        {
          "type":"postback",
          "payload": "viewmore",
          "title":"View more"
        },
        {
          "type":"postback",
          "payload": "categories",
          "title": "Filter categories"
        }
      ]
    }
  elsif queries.include? "product_type"
    structured_reply[:attachment][:payload][:elements] << {
      "title":"See more products",
      "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png",
      "buttons":[
        {
          "type":"postback",
          "payload": "viewmore",
          "title":"View more"
        },
        {
          "type":"postback",
          "payload": "pricerange",
          "title": "Filter price"
        },
        {
          "type":"postback",
          "payload": "brands",
          "title": "Filter brands"
        }
      ]
    }
  elsif queries.include? "pricerange"
    structured_reply[:attachment][:payload][:elements] << {
      "title":"See more products",
      "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png",
      "buttons":[
        {
          "type":"postback",
          "payload": "viewmore",
          "title":"View more"
        },
        {
          "type":"postback",
          "payload": "brands",
          "title":"Filter brands"
        },
        {
          "type":"postback",
          "payload": "categories",
          "title":"Filter categories"
        }
      ]
    }

  elsif queries.include? "vendor"
    structured_reply[:attachment][:payload][:elements] << {
      "title":"See more products",
      "image_url": "http://res.cloudinary.com/dltbqhact/image/upload/v1464040529/keep_browsing_3_ydqmtr.png",
      "buttons":[
        {
          "type":"postback",
          "payload": "viewmore",
          "title":"View more"
        },
        {
          "type":"postback",
          "payload": "categories",
          "title": "Filter categories"
        },
        {
          "type":"postback",
          "payload": "pricerange",
          "title": "Filter by price"
        }
      ]
    }
  end

  if counter < 9
    structured_reply[:attachment][:payload][:elements].last[:title] = "Add a filter"
    structured_reply[:attachment][:payload][:elements].last[:buttons].shift
  end
  structured_reply
end


########## DISPLAY PRODUCTS WHEN THE QUERY RETURNS LESS THAN 9 PRODUCTS ##########
def less_than_9_products(session, products, sender, structured_reply)
  p "MOINS DE 9"
  context = session.context
  p products["products"].count
  products["products"][0..9].each do |product|
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
            "payload": "#{product["id"]}: pictures",
            "title":"More pictures"
          },            {
            "type":"postback",
            "payload": "#{product["id"]}: stock",
            "title":"Check stock"
          }
        ]
      }
  end
  last_card(session, structured_reply, 8)
  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end


########## DISPLAY PRODUCTS WHEN THERE ARE MORE THAN 9 PRODUCTS LEFT TO DISPLAY ##########
def more_than_9_products_left(products, session, products_showed, structured_reply)
  context = session.context
  products["products"][products_showed..(products_showed + 8)].each do |product|
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
            "payload": "#{product["id"]}: pictures",
            "title":"More pictures"
          },            {
            "type":"postback",
            "payload": "#{product["id"]}: stock",
            "title":"Check stock"
          }
        ]
      }
  end
  p "PB CONTEXT"
  p context
  last_card(session, structured_reply, 10)

end

########## DISPLAY PRODUCTS WHEN THERE ARE LESS THAN 9 PRODUCTS LEFT TO DISPLAY ##########
def less_than_9_products_left(products, session, products_showed, structured_reply)
  context = session.context
  products["products"][products_showed..(products_showed + 9)].each do |product|
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
            "payload": "#{product["id"]}: pictures",
            "title":"More pictures"
          },            {
            "type":"postback",
            "payload": "#{product["id"]}: stock",
            "title":"Check stock"
          }
        ]
      }
  end
  last_card(session, structured_reply, 8)
end

########## CHOOSES THE MESSAGE TO SEND BASED ON THE NUMBER OF PRODUCTS TO DISPLAY ##########
def generic_template_message(session, products, sender, context, msg)
  p "GENERIC"
  p context
  queries = session.queries.map{|q| q.attr}

  structured_reply = {
    "attachment":{
      "type": "template",
      "payload":{
        "template_type": "generic",
        "elements": []
      }
    }
  }
  if products["products"].length < 9
    less_than_9_products(session, products, sender, structured_reply)
  else
    products_showed = context["products_showed"] * 9
    products_left = products["products"].count - (context["products_showed"] * 9)
    if products_left > 9
      more_than_9_products_left(products, session, products_showed, structured_reply)
    elsif products_left > 0
      less_than_9_products_left(products, session, products_showed, structured_reply)
    end
    sender.reply(structured_reply)
    transfer_middle_office(session.id, sender, structured_reply)
    p "ENVOYE"
  end
end

def more_info_message(product, sender)
  p "MORE INFO"
  p product
  infos = ActionView::Base.full_sanitizer.sanitize(product["product"]["body_html"])
   structured_reply = {
    "attachment":{
      "type":"template",
      "payload":{
        "template_type":"button",
        "text": infos,
        "buttons":[
          {
            "type":"postback",
            "title":"Check stock",
            "payload": "#{product["product"]["id"]}: stock"
          },
          {
            "type":"postback",
            "title":"More pictures",
            "payload": "#{product["product"]["id"]}: pictures"
          }
        ]
      }
    }
  }
  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end
# Method for displaying a carousel of all the images of a specific product

def more_pictures_message(product, sender)
  structured_reply = {
    "attachment":{
      "type": "template",
      "payload":{
        "template_type": "generic",
        "elements": []
      }
    }
  }

  product["product"]["images"].each do |image|
    structured_reply[:attachment][:payload][:elements] <<
      { "title": "Detailed images",
        "image_url": image["src"],
        "buttons":[
          {
            "type":"postback",
            "payload": "#{product["product"]["id"]}: info",
            "title":"More info"
          },
          {
            "type":"postback",
            "payload": "#{product["product"]["id"]}: stock",
            "title":"Check stock"
          }
        ]
      }
  end
  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end


####### RECEIPT FOR HOME DELIVERY #############
def address_receipt(product, sender, session)
  order = Order.find(session.order_id)
  products = order.purchases
  first_name = sender.get_profile[:body]["first_name"]
  last_name = sender.get_profile[:body]["last_name"]
  p first_name
  p last_name
  context = session.context
  structured_reply = {  "attachment":{
                          "type":"template",
                          "payload":{
                            "template_type":"receipt",
                            "recipient_name":"#{first_name} #{last_name}",
                            "order_number": session.id,
                            "currency":"USD",
                            "payment_method":" ",
                            "order_url":"https://www.facebook.com/myhipsterstore/",
                            "timestamp": Time.now.to_i,
                            "elements":[
                              {
                                "title": product["product"]["title"],
                                "subtitle": "100% cotton",
                                "quantity":1,
                                "price":  product["product"]["variants"].first["price"].to_i,
                                "currency":"USD",
                                "image_url": product["product"]["images"].first["src"]
                              }
                            ],
                            "address":{
                              "street_1": context["address"],
                              "street_2":"",
                              "city": context["city"],
                              "postal_code": context["zipcode"],
                              "state": context["area"],
                              "country": context["country"]
                            },
                            "summary":{
                              "total_cost": product["product"]["variants"].first["price"].to_i
                            }
                          }
                        }
                      }
  order.purchases.each do |purchase|
    product = Oj.load(RestClient.get "https://#{ENV['shopify_token']}@myshopifybot.myshopify.com/admin/products/#{purchase.item_id}.json?")
    structured_reply[:attachment][:payload][:elements] <<
      {
        "title": product["product"]["title"],
        "subtitle": "100% cotton",
        "quantity":1,
        "price":  product["product"]["variants"].first["price"].to_i,
        "currency":"USD",
        "image_url": product["product"]["images"].first["src"]
      }
  end

  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end

####### RECEIPT FOR PICKUP IN STORE #############
def store_receipt(sender, session)
  order = Order.find(session.order_id)
  products = order.purchases
  first_name = sender.get_profile[:body]["first_name"]
  last_name = sender.get_profile[:body]["last_name"]
  context = session.context
  store = Store.find(context["store_id"].to_i)
  total_cost = 0
  structured_reply = {  "attachment":{
                          "type":"template",
                          "payload":{
                            "template_type":"receipt",
                            "recipient_name":"#{first_name} #{last_name}",
                            "order_number": session.id,
                            "currency":"USD",
                            "payment_method":" ",
                            "order_url":"https://www.facebook.com/myhipsterstore/",
                            "timestamp": Time.now.to_i,
                            "elements":[
                            ],
                            "address":{
                              "street_1": store.address,
                              "street_2":"",
                              "city": store.city,
                              "postal_code": store.zipcode,
                              "state": store.area,
                              "country": store.country
                            },
                            "summary":{
                              "total_cost": total_cost
                            }
                          }
                        }
                      }

  order.purchases.uniq{|u| u.item_id}.each do |purchase|
    product = Oj.load(RestClient.get "https://#{ENV['shopify_token']}@myshopifybot.myshopify.com/admin/products/#{purchase.item_id}.json?")
    structured_reply[:attachment][:payload][:elements] <<
      {
        "title": product["product"]["title"],
        "subtitle": "100% cotton",
        "quantity":1,
        "price":  product["product"]["variants"].first["price"].to_i,
        "currency":"USD",
        "image_url": product["product"]["images"].first["src"]
      }

      total_cost += product["product"]["variants"].first["price"].to_i
  end
  structured_reply[:attachment][:payload][:summary][:total_cost] = total_cost
  transfer_middle_office(session.id, sender, structured_reply)
  sender.reply(structured_reply)
end
