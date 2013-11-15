class ProdutosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  def index
    @produtos = Produto.all
  end

  def show
  end

  def new
    @produto = Produto.new
  end

  def create

    @produto = Produto.new(produto_params)

    if @produto.save
      redirect_to @produto
    else
      render action: 'new'
    end
  end
end

private
def set_produto
  @produto = Produto.find(params[:id])
end

def produto_params
  params.require(:produto).permit(:nome, :descricao)
end