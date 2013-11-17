class CategoriasController < ApplicationController
  before_filter :authenticate_user!

  def index
    @categorias = Categoria.select(:nome).where("nome like ?", "%#{params[:term]}%").map(&:nome)
    render :json => @categorias.to_json
  end

  def listar_todas
    @categorias = Categoria.all
    render :layout => false
  end

end