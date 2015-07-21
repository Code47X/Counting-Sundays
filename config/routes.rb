Rails.application.routes.draw do
  root 'home#index'

  get '/results', to: 'home#results'
end
