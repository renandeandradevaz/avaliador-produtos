class ProdutosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @produto = Produto.new
  end

  def pesquisar

    nome_produto = params[:produto][:nome]
    nome_categoria = params[:produto][:categoria][:nome]

    if nome_categoria.present?
      @produtos = Produto.includes(:categoria).where(categoria: Categoria.where(nome: nome_categoria).take!).where("nome like ?", "%#{nome_produto}%")
    else
      @produtos = Produto.includes(:categoria).where("nome like ?", "%#{nome_produto}%")
    end

    render :layout => false

  end

  def show
    @produto = Produto.find(params[:id])
  end

  def new
    @produto = Produto.new
  end

  def create

    @produto = Produto.new(produto_params)

    @produto.vincular_a_categoria params[:produto][:categoria][:nome]

    if @produto.save
      redirect_to @produto
    else
      render action: 'new'
    end
  end
end

def produto_params
  params.require(:produto).permit(:nome, :descricao, :imagem)
end