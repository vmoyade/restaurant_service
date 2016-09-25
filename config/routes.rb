Rails.application.routes.draw do
  namespace :api do 
    resources :restaurants,only: :index, :defaults => { :format => 'json' }
  end
end
