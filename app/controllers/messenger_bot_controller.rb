class MessengerBotController < ApplicationController

  skip_before_action :verify_authenticity_token

  def webhook
    render :json => params["hub.challenge"]
  end

  def analyze_request(msg, sender, session)
    update_context(msg, session, sender)
    username = sender.get_profile[:body]["first_name"]
    answer(session, username, sender, msg)
  end

  def find_address(lat, long)
    query = "#{lat},  #{long}"
    Geocoder.search(query).first.data.first[-1][-2]["long_name"]
  end

  def message(event, sender)
    p "SENDER"
    p sender.class
    msg = event["message"]["text"]
    sender_id = event["sender"]["id"].to_i
    session = find_or_create_session(sender_id)
    username = sender.get_profile[:body]["first_name"]
    p "PROFILE"
    p sender.get_profile[:body]["profile_pic"]
    session.last_exchange =  Time.now
    session.count_messages += 1
    session.save
    mms_url = "https://mymessagingstore.herokuapp.com/api/v1/sessions?fbid=#{sender_id}&msg=#{msg}&first_name=#{username}&sender=user"
    p mms_url
  #  RestClient.post URI.encode(mms_url), :content_type => :json, :accept => :json


    unless session.status == "human"
      if event["message"]["attachments"].present?
        p event["message"]["attachments"].first["title"]
        if event["message"]["attachments"].first["title"].nil?
          sender.reply({text: "Sorry but we can't process images (yet :-) )"})
          transfer_middle_office(session.id, sender, "Sorry but we can't process images (yet :-) )")
        else
          if event["message"]["attachments"][0]["payload"]
            if event["message"]["attachments"][0]["payload"]["coordinates"]
              latitude = event["message"]["attachments"][0]["payload"]["coordinates"]["lat"]
              longitude = event["message"]["attachments"][0]["payload"]["coordinates"]["long"]
              session.context["location"] = find_address(latitude, longitude)
              session.save
              msg = "address_received"
            end
          end
        end
      end
      unless msg.nil?
        analyze_request(msg, sender, session)
      end
    end
  end

  def postback(event, sender)
    msg = event["postback"]["payload"]
    sender_id = event["sender"]["id"].to_i
    session = find_or_create_session(sender_id)
    session.update(last_exchange: Time.now)
    analyze_request(msg, sender, session)
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
