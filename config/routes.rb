Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    post "/users" => "users#create"
    delete "/users/:id" => "users#destroy"

    get "/locations" => "locations#index"
    get "/locations/:id" => "locations#show"
    post "/locations" => "locations#create"

    get "/reviews" => "reviews#index"
    post "/reviews" => "reviews#create"
    delete "/reviews/:id" => "reviews#destroy"

  end
end
