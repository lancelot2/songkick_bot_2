# # method for laying out the store carousel

# def store_selection(sender, session)
#   structured_reply = {
#           "attachment":{
#             "type": "template",
#             "payload":{
#               "template_type": "generic",
#               "elements": []
#             }
#           }
#         }
#     Store.where(country: session.context["location"]).each do |store|
#     structured_reply[:attachment][:payload][:elements] <<
#       {
#         "title": store.address,
#         "subtitle": "#{store.city}, #{store.country}",
#         "image_url": store.main_image,
#         "buttons":[
#             {
#               "type":"postback",
#               "payload": "#{store.id}: chosen",
#               "title": "Choose"
#             }

#           ]
#       }
#     end
#   sender.reply(structured_reply)
#   transfer_middle_office(session.id, sender, structured_reply)
# end


# # method for picking the delivery option

# def cta_delivery_message(sender)
#   structured_reply = {
#     "attachment":{
#       "type":"template",
#       "payload":{
#         "template_type":"button",
#         "text": "How do you want to proceed: ",
#         "buttons":[
#           {
#             "type":"postback",
#             "title":"Delivery at home",
#             "payload":"delivery"
#           },
#           {
#             "type":"postback",
#             "title":"Pick up in store",
#             "payload":"pickup"
#           }
#         ]
#       }
#     }
#   }
#   sender.reply(structured_reply)
#   transfer_middle_office(session.id, sender, structured_reply)
# end

# # method to keep shopping or checkout

# def checkout_or_browse(session, sender)
#   structured_reply = {
#     "attachment":{
#       "type":"template",
#       "payload":{
#         "template_type":"button",
#         "text": "Done. Do you want to continue shopping or checkout ?",
#         "buttons":[
#           {
#             "type":"postback",
#             "title":"Continue",
#             "payload":"continue"
#           },
#           {
#             "type":"postback",
#             "title":"Checkout",
#             "payload":"checkout"
#           }
#         ]
#       }
#     }
#   }
#   sender.reply(structured_reply)
#   transfer_middle_office(session.id, sender, structured_reply)
# end
