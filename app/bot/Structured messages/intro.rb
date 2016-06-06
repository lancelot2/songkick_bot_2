# method for laying out the main browsing path

def cta_intent_message(session, sender)
  structured_reply = {
    "attachment":{
      "type":"template",
      "payload":{
        "template_type":"button",
        "text":"How do you want to start browsing? Through...",
        "buttons":[
          {
            "type":"postback",
            "title":"Categories",
            "payload":"category"
          },
          {
            "type":"postback",
            "title":"Brands",
            "payload":"brand"
          },
          {
            "type":"postback",
            "title":"Price range",
            "payload":"pricerange"
          }
        ]
      }
    }
  }

  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end


# method for rolling over at the end of the script

def cta_restart_message(session, sender)
  structured_reply = {
    "attachment":{
      "type":"template",
      "payload":{
        "template_type":"button",
        "text":"What do you want to do now:",
        "buttons":[
          {
            "type":"postback",
            "title":"Back to main menu",
            "payload":"mainbrowsing"
          },
          {
            "type":"postback",
            "title":"Back to your selection",
            "payload":"filtered"
          },
          {
            "type":"postback",
            "title":"Select a store",
            "payload":"productdescription"
          }
        ]
      }
    }
  }
  sender.reply(structured_reply)
  transfer_middle_office(session.id, sender, structured_reply)
end

