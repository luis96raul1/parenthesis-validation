Rails.application.routes.draw do
  root to: 'parenthesis#index'
  get '/validate', to: 'parenthesis#validate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
