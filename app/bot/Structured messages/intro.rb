# method for laying out the main browsing path
def cta_intent_message(session, sender)
  structured_reply = ButtonTemplate.new
  structured_reply.set_text("Or I can help you browse by...")
  structured_reply.add_postback("Cities", "city")
  structured_reply.add_postback("Venues", "venue")
  structured_reply.add_postback("Artists", "artist")
  reply_transfer(session, sender, structured_reply)
end


# # method for rolling over at the end of the script
# def cta_restart_message(session, sender)
#   structured_reply = ButtonTemplate.new
#   structured_reply.set_text("What do you want to do now:")
#   structured_reply.add_postback("Back to main menu", "mainbrowsing")
#   structured_reply.add_postback("Back to your selection", "filtered")
#   structured_reply.add_postback("Select a store", "productdescription")
#   reply_transfer(session, sender, structured_reply)
# end

