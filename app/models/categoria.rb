class Categoria < ActiveRecord::Base

  self.table_name = "categorias"

  has_many :produtos

end
