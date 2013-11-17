class Nota < ActiveRecord::Base

  self.table_name = "notas"

  belongs_to :produto
  belongs_to :user

  after_save :atualizar_nota_media_produto

  def atualizar_nota_media_produto

    self.produto.nota_media = Nota.where(produto: self.produto).average('nota')
    self.produto.save

  end


end
