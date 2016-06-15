class MessengerBotController < ApplicationController

  skip_before_action :verify_authenticity_token

  # def webhook
  #   render :json => params["hub.challenge"]
  # end

  def analyze_request(msg, sender, session)
    previous_context = session.context.clone
    update_context(msg, session, sender)
    username = sender.get_profile[:body]["first_name"]
    answer(session, username, sender, msg)
  end

  def find_address(lat, long)
    query = "#{lat},  #{long}"
    Geocoder.search(query).first.data.first[-1][-2]["long_name"]
  end

  def message(event, sender)
    p "MESSAGE"
    p event
    msg = event["message"]["text"]
    sender_id = event["sender"]["id"].to_i
    session = find_or_create_session(sender_id)
    unless session.msg == nil
      session.previous_message = session.msg.clone
    end
    session.msg = msg
    username = sender.get_profile[:body]["first_name"]
    session.last_exchange =  Time.now
    session.count_messages += 1
    session.previous_context = session.context.clone

    session.save
    transfer_middle_office(session_id, sender, msg = "", "user")


    unless session.status == "human"
      if event["message"]["attachments"].present?
        p event["message"]["attachments"].first["title"]
        if event["message"]["attachments"].first["title"].nil?
          sender.reply({text: "Sorry but we can't process images (yet :-) )"})
          transfer_middle_office(session.id, sender, "Sorry but we can't process images (yet :-) )", "bot")
        else
          if event["message"]["attachments"][0]["payload"]
            if event["message"]["attachments"][0]["payload"]["coordinates"]
              latitude = event["message"]["attachments"][0]["payload"]["coordinates"]["lat"]
              longitude = event["message"]["attachments"][0]["payload"]["coordinates"]["long"]
              session.context["lat"] = latitude
              session.context["lng"] = longitude
              session.context["location"] = find_address(latitude, longitude)
              session.save
              msg = "loc determination"
            end
          end
        end
      end
      unless msg.nil?
        p "ANALYSE"
        analyze_request(msg, sender, session)
      end
    end
  end

  def postback(event, sender)
    p "MESSAGE"
    p event
    msg = event["postback"]["payload"]
    sender_id = event["sender"]["id"].to_i
    session = find_or_create_session(sender_id)
    session.update(last_exchange: Time.now)
    analyze_request(msg, sender, session)
    transfer_middle_office(session_id, sender, msg = "", "user")
  end

  private

  def find_or_create_session(fbid, max_age: 1.minutes)
    if Session.find_by(["facebook_id = ? AND last_exchange >= ?", fbid, max_age.ago])
      session = Session.find_by(["facebook_id = ? AND last_exchange >= ?", fbid, max_age.ago])
    else
      order = Order.create
      session = Session.create(facebook_id: fbid, context: {}, order_id: order.id)
    end
  end

end
