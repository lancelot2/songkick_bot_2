# Method of allowing the user to pick between 2 different listings: the trendiest and the most popular artists

def artists(sender)
  structured_reply = ButtonTemplate.new
  structured_reply.set_text("Just type your favorite artist name, unless you want to browse through our selection of...")
  structured_reply.add_postback("Popular artists", "popular_artists")
  structured_reply.add_postback("Trending artists", "trending_artists")
  reply_transfer(session, sender, structured_reply)
end

