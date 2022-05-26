Rails.application.routes.draw do
  resources :tasks, only: %i[index create update destroy]
end