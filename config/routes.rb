Rails.application.routes.draw do
  namespace :api do
    devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout'
               },
               controllers: {
                 sessions: 'api/sessions',
                 passwords: 'api/passwords'
               }, defaults: { format: :json }

    resources :users, only: :create
    resources :books, only: [:create, :index] do
      resources :reviews, only: [:create, :index]
    end
  end
end
