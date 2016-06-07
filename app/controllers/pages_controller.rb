class PagesController < ApplicationController
  def home
    @message = t('welcome_message')
  end
end
