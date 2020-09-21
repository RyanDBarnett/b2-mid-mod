Rails.application.routes.draw do
  get '/flights', to: 'flights#index'

  get '/airlines/:id', to: 'airlines#show'
end
