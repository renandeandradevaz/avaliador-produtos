AvaliadorProdutos::Application.routes.draw do

  root to: 'produtos#index'

  devise_for :users

  ActiveAdmin.routes(self)

  resources :produtos

end
