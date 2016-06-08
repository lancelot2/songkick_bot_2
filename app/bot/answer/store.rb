# def store(session, username, sender, msg = "")
#   context = session.context
#   if context["intent"] == "receipt"
#     sender.reply({text: t('receipt-intro')})
#     transfer_middle_office(session.id, sender, t('receipt-intro'))
#     store_receipt(sender, session)
#     sleep(3)
#     sender.reply({text: t('receipt-conclusion')})
#     transfer_middle_office(session.id, sender, t('receipt-conclusion'))
#     sleep(2)
#     cta_restart_message(sender)
#   elsif context["intent"] == "pickup"
#     Purchase.create(order_id: session.order_id, item_id: context["product_id"])
#     checkout_or_browse(session, sender)
#     context["concerts_showed"] = 0
#     session.update(context: context)
#   elsif context["intent"] == "get_location"
#     sender.reply({text: t('collecting-user-location')})
#     transfer_middle_office(session.id, sender, t('collecting-user-location'))
#   end
# end
