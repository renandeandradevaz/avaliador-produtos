class ProdutosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @produto = Produto.new
  end

  def pesquisar

    nome_produto = params[:produto][:nome]
    nome_categoria = params[:produto][:categoria][:nome]

    if nome_categoria.present?
      @produtos = Produto.includes(:categoria).where(categoria: Categoria.where(nome: nome_categoria).take!).where("nome like ?", "%#{nome_produto}%").order(nota_media: :desc)
    else
      @produtos = Produto.includes(:categoria).where("nome like ?", "%#{nome_produto}%").order(nota_media: :desc)
    end

    render :layout => false

  end

  def show
    @produto = Produto.find(params[:id])
    @comentarios = @produto.comments.order(created_at: :desc)
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

  def dar_nota

    produto = Produto.find(params[:id_produto])
    nota = Nota.where(user: current_user, produto: produto).take

    if nota.nil?
      nota = Nota.new
    end

    nota.produto = produto
    nota.user = current_user
    nota.nota = params[:nota]

    nota.save

    @nota =  nota.nota

  end

  def comentar

    @produto = Produto.find(params[:produto_comentario])

    @produto.comments.create(:comment => params[:comentario], :user => current_user)

    @comentario = @produto.comments.last

    render :layout => false

  end

  def produto_params
    params.require(:produto).permit(:nome, :descricao, :imagem)
  end

end

