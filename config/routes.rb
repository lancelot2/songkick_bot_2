Rails.application.routes.draw do
  root 'pages#home'
 # mount Messenger::Bot::Space => "/webhook"
  get "/webhook", to: "messenger_bot#webhook"
  get 'req' => 'analyzer#req'
  get 'shopify/req' => 'shopify#req'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [ :index, :show, :update, :create ]
       post 'session_update', to: "sessions#context_update"
    end
  end

end

