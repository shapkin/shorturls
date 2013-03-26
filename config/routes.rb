Shorturls::Application.routes.draw do
  root :to => 'news_items#index'

  get '/n/:key', to: 'news_items#find'

  resources :news, controller: 'news_items', only: [:index, :show]
end