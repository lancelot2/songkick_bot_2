def transfer_middle_office(session_id, sender, msg = "")
  # SETUP API KEYS
  # TODO: add lines for api
  session = Session.find(session_id)
  sender_id = session.facebook_id
  p "MIDDLE"
  username = sender.get_profile[:body]["first_name"]
  profile_picture = {profile_pic: (sender.get_profile[:body]["profile_pic"])}.to_query
  p msg
  url = "https://mymessagingstore.herokuapp.com/api/v1/sessions?fbid=#{sender_id}&msg=#{msg}&first_name=#{username}&sender=bot&context=#{session.context}&#{profile_picture}"
  RestClient.post URI.encode(url), :content_type => :json, :accept => :json
end
