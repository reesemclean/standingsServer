Rails.application.routes.draw do
  resources :leagues do
    resources :results, shallow: true
    resources :teams, shallow: true
  end
end
