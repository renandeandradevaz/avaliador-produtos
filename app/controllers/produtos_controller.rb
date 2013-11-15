class ProdutosController < ApplicationController
  before_filter :authenticate_user!

end
