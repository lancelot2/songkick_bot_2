# Method for updating the context each time that the user send something

def update_context(msg, session, sender)
  previous_context = session.context.clone
  session.update(context: intent_determination(msg, session.context, sender, session))
  # Call entities_determination for each entity (brand, category ...)
  session.update(context: entities_determination(msg, session.context, "pass a parameter"))

  unless session.context.size == 0
    if previous_context == session.context
      session.context["intent"] = "lost"
      session.save
    end
  end
end


# Method for sending a help notification to admins through Messenger

def help_request(username)
  msg = "#{username} needs help to complete its purchase"
  token = "CAAKs4sjMLtgBACbNSA3adhDT76dxu4A2iqNsZBcsfPgCMeVBZCbB7yGI5SiPU6PbfpFyi2W7zEclj8YXYxCG9VLcWZCBVT4XsBBEFJt6tAH8XYu1Y0W6BJsT2L6YNSvHnYV6pAgIaZB7HWrzchURHT0eSdyFB8OKR0wkkhjg0yatEx3XBIZAedcSRZAFXuSHIZD"
  url = "https://graph.facebook.com/v2.6/me/messages?"
  request_params =  {
    recipient: {id: 1005252772892814},
    "message":{
        "text": msg
    },
    access_token: token
  }
  RestClient.post url, request_params.to_json, :content_type => :json, :accept => :json
end

