require 'open-uri'
require 'net/https'
require 'json'
require 'rest-client'
require 'awesome_print'
require 'oj'
require 'mechanize'

# # class GenericTemplate
# #   def initialize
# #       @template = {
# #                   'attachment': {
# #                       'type': 'template',
# #                       'payload': {
# #                           'template_type': 'generic',
# #                           'elements': []
# #                       }
# #                   }
# #               }
# #       @elements = []
# #   end

# #   def add_element(title = '', item_url = '', image_url = '', subtitle = '', buttons = [])
# #       element = {}
# #       element['title'] = title
# #       element['item_url'] = item_url
# #       element['image_url'] = image_url
# #       element['subtitle'] = subtitle
# #       unless buttons.size == 0
# #         element['buttons'] = buttons
# #       end
# #       @elements << element
# #   end

# #   def get_message
# #       @template[:attachment][:payload][:elements] = @elements
# #       return @template
# #   end
# # end

# # # # class ButtonTemplate
# # # #     def initialize(text='')
# # # #         @template = {
# # # #                   'attachment': {
# # # #                       'type': 'template',
# # # #                       'payload': {
# # # #                            'template_type': 'button',
# # # #                             'text': '',
# # # #                             'buttons': []
# # # #                       }
# # # #                   }
# # # #               }
# # # #     end
# # # #     def add_web_url(title='', url='')
# # # #         web_url_button = {}
# # # #         web_url_button['type'] = 'web_url'
# # # #         web_url_button['title'] = title
# # # #         web_url_button['url'] = url
# # # #         @template['attachment']['payload']['buttons'] << (web_url_button)
# # # #     end

# # # #     def add_postback(title='', payload='')
# # # #         postback_button = {}
# # # #         postback_button['type'] = 'postback'
# # # #         postback_button['title'] = title
# # # #         postback_button['payload'] = payload
# # # #         @template[:attachment][:payload][:buttons] << (postback_button)
# # # #     end

# # # #     def set_text(text='')
# # # #         @text = text
# # # #     end

# # # #     def get_message
# # # #         @template[:attachment][:payload][:text] = @text
# # # #         return @template
# # # #     end
# # # # end

# # # class ImageTemplate
# # #     def initialize(url='')
# # #         @template = { 'attachment': {
# # #                             'type': 'image',
# # #                             'payload': {
# # #                                 'url': ''
# # #                             }
# # #                         }
# # #                     }
# # #         @url = url
# # #     end

# # #     def set_url(url='')
# # #         @url = url
# # #     end

# # #     def get_message
# # #         @template[:attachment][:payload][:url] = @url
# # #         return @template
# # #     end
# # # end



# # class Button
# #     def initialize(text='')
# #         @template = {}
# #     end
# #     # def add_web_url(title='', url='')
# #     #   web_url_button = {}
# #     #   web_url_button['type'] = 'web_url'
# #     #   web_url_button['title'] = title
# #     #   web_url_button['url'] = url
# #     #   @template['attachment']['payload']['buttons'] << (web_url_button)
# #     # end

# #     def add_postback(title='', payload='')
# #       @template['type'] = 'postback'
# #       @template['title'] = title
# #       @template['payload'] = payload
# #     end

# #     # def set_text(text='')
# #     #   @text = text
# #     # end

# #     def get_message
# #       return @template
# #     end
# # end
# class ReceiptTemplate
#   def initialize(recipient_name='', order_number='', currency='', payment_method='', timestamp='', order_url='')
#       @template = {
#         'attachment': {
#             'type': 'template',
#             'payload': {
#                 'template_type': 'receipt',
#                 'recipient_name': '',
#                 'order_number': '',
#                 'currency': '',
#                 'payment_method': ''
#             }
#         }
#     }
#       @template[:attachment][:payload]['recipient_name'] = recipient_name
#       @template[:attachment][:payload]['order_number'] = order_number
#       @template[:attachment][:payload]['currency'] = currency
#       @template[:attachment][:payload]['payment_method'] = payment_method
#       if timestamp != ''
#           @template[:attachment][:payload]['timestamp'] = timestamp
#       end
#       if order_url != ''
#           @template[:attachment][:payload]['order_url'] = order_url
#       end
#       @elements = []
#       @address = {}
#       @summary = {}
#       @adjustments = []
#   end
#   def add_element(title='', subtitle='', quantity=-1, price=0, currency='', image_url='')
#       element = {}
#       element['title'] = title
#       if subtitle != ''
#        element['subtitle'] = subtitle
#       end
#       if quantity != -1
#           element['quantity'] = quantity
#       end
#       element['price'] = price
#       if currency != ''
#           element['currency'] = currency
#       end
#       if image_url != ''
#           element['image_url'] = image_url
#       end
#       @elements << element
#   end
#   def set_address(street_1='', street_2='', city='', postal_code='', state='', country='')
#       @address['street_1'] = street_1
#       if street_2 != ''
#           @address['street_2'] = street_2
#       end
#       @address['city'] = city
#       @address['postal_code'] = postal_code
#       @address['state'] = state
#       @address['country'] = country
#   end
#   def set_summary(subtotal=-1, shipping_cost=-1, total_tax=-1, total_cost=0)
#       if subtotal != -1
#           @summary[:subtotal] = subtotal
#       end
#       if shipping_cost != -1
#           @summary[:shipping_cost] = shipping_cost
#       end
#       if total_tax != -1
#           @summary[:total_tax] = total_tax
#       end
#       @summary[:total_cost] = total_cost
#   end
#   def add_adjustment(name='', amount=0)
#       adjustment = {}
#       adjustment['name'] = name
#       adjustment['amount'] = amount
#       @adjustments << (adjustment)
#   end
#   def get_message
#       @template[:attachment][:payload][:elements] = @elements
#       if @address != {}
#           @template[:attachment][:payload][:address] = @address
#       end
#       @template[:attachment][:payload][:summary] = @summary
#       if @adjustments != []
#           @template[:attachment][:payload][:adjustments] = @adjustments
#       end
#       return @template
#   end
# end


# button = ReceiptTemplate.new("Matthias", "122346", "USD", "paypal", Time.now.to_i)
# button.add_element('Tshirt','top', "1", "10", "USD", 'https://s-media-cache-ak0.pinimg.com/736x/04/03/27/040327e01ef3f42a1eae9c4b2d1c299f.jpg')
# button.set_address("13 allée", "", "Paris", "75011", "IDF", "FRancse")
# button.set_summary(10, 10, 10, 100)

# p button.get_message

#   token = "CAAKs4sjMLtgBACbNSA3adhDT76dxu4A2iqNsZBcsfPgCMeVBZCbB7yGI5SiPU6PbfpFyi2W7zEclj8YXYxCG9VLcWZCBVT4XsBBEFJt6tAH8XYu1Y0W6BJsT2L6YNSvHnYV6pAgIaZB7HWrzchURHT0eSdyFB8OKR0wkkhjg0yatEx3XBIZAedcSRZAFXuSHIZD"
#   url = "https://graph.facebook.com/v2.6/me/messages?"
#   request_params =  {
#     recipient: {id: 1006889982732663},
#     "message": button.get_message,

#     access_token: token
#   }
#   RestClient.post url, request_params.to_json, :content_type => :json, :accept => :json
 # msg = 'USA'
 # context = {}
 # countries = [["US", "USA", "States", "America", "United States"], ["UK", "Great Britain", "United Kingdom", "England", "Scotland"], ["Europe", "France", "Germany", "Holland", "Danemark", "Sweden", "Spain", "Ireland", "Italy", "Hungary"]]
 #  usa_cities = [["San Francisco", "SF"], ["Los Angeles", "LA"], ["New York", "New-York", "NY", "NYC"], ["Portland"], ["Washington"], ["Philadelphia"], ["Seattle"], ["Chicago"], ["Orlando"], ["Pittsburg"]]
 #  uk_cities = [["London", "ldn"], ["Manchester"], ["Glasgow"], ["Edinburgh"], ["Birmingham"], ["Newcastle"], ["Bristol"], ["Belfast"], ["Brighton"], ["Liverpool"]]
 #  european_cities = [["Paris", "Pari"], ["Berlin"], ["Amsterdam"], ["Barcelona"], ["Copenhagen"], ["Stockholm"], ["Dublin"], ["Prague"], ["Rome"], ["Budapest"]]
 #  keywords = countries + usa_cities + uk_cities + european_cities
 #  p keywords
 #  p 'ENTITIES DETERMINATION'


 #  tokenized_array = msg.downcase.split
 #  p tokenized_array
 #  keywords.each do |array|
 #    p array
 #    if (tokenized_array & array).any?
 #       p "FIRST ARRAY"
 #       p array.first
 #       context[parameter] = array.first
 #       context["intent"] = parameter
 #    end
 #  end
 #url =
concert_url = "http://api.songkick.com/api/3.0/metro_areas/24426/calendar.json?apikey=h76Z5PDgOid28Zly"
response =  Oj.load(RestClient.get concert_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["event"]
response.each do |c|
  p c["displayName"]
  p c["venue"]["displayName"]
end

artist_url = "http://api.songkick.com/api/3.0/search/artists.json?query=Rich Stephenson&apikey=h76Z5PDgOid28Zly"
response =  Oj.load(RestClient.get artist_url, :content_type => :json, :accept => :json)["resultsPage"]["results"]["artist"][0]["uri"]
p response
 #h76Z5PDgOid28Zly

 a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get(response) do |page|
  ap "http:" + page.search(".artist-profile-image")[10].attributes["src"].value
end
