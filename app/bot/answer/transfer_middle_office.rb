def transfer_middle_office(session_id, sender, msg = "", type)
  key = Digest::SHA1.hexdigest("--#{ENV['mms_secret']}--#{ENV['mms_token']}--")
  session = Session.find(session_id)
  sender_id = session.facebook_id
  username = sender.get_profile[:body]["first_name"]
  profile_picture = {profile_pic: (sender.get_profile[:body]["profile_pic"])}.to_query
  url = "https://mymessagingstore.herokuapp.com/api/v1/sessions"
  RestClient.post URI.encode(url), :content_type => :json, :accept => :json
  RestClient.post( url,
  {
    :bot_id => ENV['mms_token'],
    :key => key,
    :fbid => sender_id,
    :msg => msg,
    :first_name => username,
    :sender => type,
    :context => session.context,
    :profile_pic => profile_picture

  })
end
