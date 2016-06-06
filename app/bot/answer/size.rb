def size(session, username, sender, msg = "")
  context = session.context
  if context["intent"] == "sizes"
    #product = Oj.load(RestClient.get # CUSTOMER API: ENV['API_TOKEN'])
    ans = " "
    get_stock(session,sender)
    sender.reply({text: ans})
    transfer_middle_office(session.id, sender, {text: ans})
  elsif context["intent"] == "booksize"
    Purchase.create(order_id: session.order_id, item_id: context["product_id"], size: context["size"])
    checkout_or_browse(session, sender)
  end
end
