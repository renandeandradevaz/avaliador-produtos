class Produto < ActiveRecord::Base
  acts_as_commentable

  belongs_to :categoria

  has_attached_file :imagem, :styles => { :grande => "500x500>", :medio => "300x300>" }, :default_url => "/assets/unknown.png"

  validates_presence_of :nome
  validates_uniqueness_of :nome

  def vincular_a_categoria(categoria_nome)

    self.categoria = Categoria.find_or_create_by nome: categoria_nome

  end

end
