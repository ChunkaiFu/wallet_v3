Rails.application.routes.draw do
  get "about-us", to: "about#index", as: :about 
  get "contact", to: "contact#index", as: :contact 
  root to: "main#index"
end