# Method of allowing the user to pick between 2 different listings: the trendiest and the most popular artists

def cta_artists_message(sender)
  structured_reply = ButtonTemplate.new
  structured_reply.set_text("How do you want to list them ?")
  structured_reply.add_postback("Most popular", "popularity")
  structured_reply.add_postback("Trending artists", "trending")
  reply_transfer(session, sender, structured_reply)
end

