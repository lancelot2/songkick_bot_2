class ShopifyController < ApplicationController

  skip_before_action :verify_authenticity_token

  def req
  #products = Oj.load(RestClient.get "https://#{ENV['shopify_token']}@myshopifybot.myshopify.com/admin/products/6192741639.json?fields=variants")
#  @products = Oj.load(RestClient.get "https://91b97aeb761861c20b777ede328d512e:ec169cbd05bcd7db7b03f5d6291a3f58@myshopifybot.myshopify.com/admin/products/6273782151.json?fields=variants,images,id,title")

  #@products = Oj.load(RestClient.get "https://91b97aeb761861c20b777ede328d512e:ec169cbd05bcd7db7b03f5d6291a3f58@myshopifybot.myshopify.com/admin/producsearch?view=json&q=nike")
  # @collection = RestClient.get 'https://91b97aeb761861c20b777ede328d512e:ec169cbd05bcd7db7b03f5d6291a3f58@myshopifybot.myshopify.com/admin/custom_collections/263046279.json'
  #@single_product = Oj.load(RestClient.get "https://91b97aeb761861c20b777ede328d512e:ec169cbd05bcd7db7b03f5d6291a3f58@myshopifybot.myshopify.com/admin/products/6208033159.json?")
  end

end
