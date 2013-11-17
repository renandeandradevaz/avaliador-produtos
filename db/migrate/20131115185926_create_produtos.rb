class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.decimal :nota_media
      t.integer :categoria_id, :null => false

      t.timestamps
    end

    add_foreign_key(:produtos, :categorias)
  end
end
