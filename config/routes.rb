Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/students/:id', to: 'students#show'
  delete '/students/:id', to: 'student_courses#destroy'

  get '/courses/:id', to: 'courses#show'
  post "/courses/:id", to: "student_courses#create"

end
