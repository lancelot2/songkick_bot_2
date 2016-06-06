def delivery(session, username, sender, msg= "")
  context = session.context
  if context["intent"] == "address_received"
    store_selection(sender, session)
  elsif context["intent"] == "address_registration"
    address_formatting(msg, session
    product = Oj.load(RestClient.get # CUSTOMER API: ENV['API_TOKEN']
    sender.reply({text: t('receipt-intro')})
    transfer_middle_office(session.id, sender, t('receipt-intro'))
    address_receipt(product, sender, session)
    sleep(3)
    sender.reply({text: t('receipt-conclusion')})
    transfer_middle_office(session.id, sender, t('receipt-conclusion'))
    sleep(2)
    cta_restart_message(sender)
  elsif context["intent"] == "delivery"
    sender.reply({text: t('collecting-user-logistic-info')})
    transfer_middle_office(session.id, sender, t('collecting-user-logistic-info'))
    context["intent"] = "address_registration"
  end
end

