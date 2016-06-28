def transfer_middle_office(session_id, sender, msg = "", type)
  key = Digest::SHA1.hexdigest("--#{ENV['mms_secret']}--#{ENV['mms_token']}--")
  session = Session.find(session_id)
  sender_id = session.facebook_id
  username = sender.get_profile[:body]["first_name"]
  profile_picture = CGI.escape(sender.get_profile[:body]["profile_pic"])
  url = "https://mymessagingstore.herokuapp.com/api/v1/sessions"
  p msg
  request_params = {
    :bot_id => ENV['mms_token'],
    :key => key,
    :fbid => sender_id,
    :msg => msg.to_s,
    :first_name => username,
    :sender => type,
    :context => session.context,
    :profile_pic => profile_picture
  }
  RestClient.post URI.encode(url), request_params.to_json, :content_type => :json, :accept => :json
  count = session.count
  if count < 3
    count += 1
    session.update(count: count)
  end
end
