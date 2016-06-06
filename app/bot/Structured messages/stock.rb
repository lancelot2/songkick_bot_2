# Method to feedback an existing stock level

def cta_stock_left_message(sender, product_stock)
  structured_reply = {
    "attachment":{
      "type":"template",
      "payload":{
        "template_type":"button",
        "text": "We have #{product_stock} left. Should I book one for you ?",
        "buttons":[
          {
            "type":"postback",
            "title":"Yes",
            "payload":"yes :stock_left"
          },
          {
            "type":"postback",
            "title":"No",
            "payload":"no :stock_left"
          }
        ]
      }
    }
  }
  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end

# Method to feedback an out of stock situation

def cta_no_stock_left_message(sender)
  structured_reply = {
    "attachment":{
      "type":"template",
      "payload":{
        "template_type":"button",
        "text": "We don't have any pairs left. Should I notify you when we'll receive one?",
        "buttons":[
          {
            "type":"postback",
            "title":"Yes",
            "payload":"yes :nostock_left"
          },
          {
            "type":"postback",
            "title":"Brands",
            "payload":"no :nostock_left"
          }
        ]
      }
    }
  }
  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end

