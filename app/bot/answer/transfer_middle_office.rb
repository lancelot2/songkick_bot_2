def transfer_middle_office(session_id, sender, msg = "")
  key = Digest::SHA1.hexdigest("--#{ENV['mms_secret']}--#{ENV['mms_token']}--")
  session = Session.find(session_id)
  sender_id = session.facebook_id
  username = sender.get_profile[:body]["first_name"]
  profile_picture = {profile_pic: (sender.get_profile[:body]["profile_pic"])}.to_query
  url = "https://mymessagingstore.herokuapp.com/api/v1/sessions?key=#{key}&fbid=#{sender_id}&msg=#{msg}&first_name=#{username}&sender=bot&context=#{session.context}&profile_picture=#{profile_picture}"
  RestClient.post URI.encode(url), :content_type => :json, :accept => :json
end

