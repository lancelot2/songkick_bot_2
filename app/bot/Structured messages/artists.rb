# Method of allowing the user to pick between 2 different listings: the trendiest and the most popular artists

def artists(sender)
  structured_reply = ButtonTemplate.new
  structured_reply.set_text("How do you want to list them ?")
  structured_reply.add_postback("Most popular", "popular_artists")
  structured_reply.add_postback("Trending artists", "trending")
  reply_transfer(session, sender, structured_reply)
end

