Rails.application.routes.draw do
  get '/flights', to: 'flights#index'

  get '/airlines/:id', to: 'airlines#show'

  delete '/passenger_flights/:id', to: 'passenger_flights#destroy'

  get '/passengers', to: 'passengers#index'
end
