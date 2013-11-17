class CreateNotas < ActiveRecord::Migration
  def change
    create_table :notas do |t|
      t.decimal :nota
      t.integer :produto_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end

    add_foreign_key(:notas, :produtos)
    add_foreign_key(:notas, :users)
  end
end
