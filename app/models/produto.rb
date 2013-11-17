class Produto < ActiveRecord::Base

  belongs_to :categoria

  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_presence_of :nome
  validates_uniqueness_of :nome

  def vincular_a_categoria(categoria_nome)

    self.categoria = Categoria.find_or_create_by nome: categoria_nome

  end

end
