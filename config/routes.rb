Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/students/:id', to: 'students#show'

  get '/courses/:id', to: 'courses#show'
end
