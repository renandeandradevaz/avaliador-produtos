class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.decimal :nota_media

      t.timestamps
    end
  end
end
