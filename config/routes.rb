AvaliadorProdutos::Application.routes.draw do

  root to: 'produtos#index'

  devise_for :users

  get "categorias/listar_todas"
  get "produtos/pesquisar"
  get "produtos/dar_nota"
  get "produtos/comentar"

  resources :produtos
  resources :categorias

end
