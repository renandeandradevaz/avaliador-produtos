AvaliadorProdutos::Application.routes.draw do

  root to: 'produtos#index'

  devise_for :users

  resources :produtos

end
