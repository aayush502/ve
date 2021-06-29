Rails.application.routes.draw do
  resources :students
  devise_for :users
  resources :abouts do
    root "abouts#new"
  end
  get "dashboard/index"
  root "customers#info"
  post "questioniare" => "api#save"
  get "customer_info" => "customers#info"
  get "customer_detail" => "customers#customer_detail"
  get "delete_customer/:id" => "customers#delete", as: "delete_customer"
  get "sign_up_user" => "customers#signup"
  post "sign_up_user" => "customers#sign_up_user"
  # get "download/:id" => "customers#download", as: "download"
  get "view/:id" => "customers#download", as: "view"
  get "about_api" => "api#get_about_api"

  get "mail_test" =>"customers#mail_test"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
