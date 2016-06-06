class Order < ActiveRecord::Base
  belongs_to :session
  has_many :purchases
end
