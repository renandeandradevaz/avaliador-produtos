class AddAttachmentImagemToProdutos < ActiveRecord::Migration
  def self.up
    change_table :produtos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    drop_attached_file :produtos, :imagem
  end
end
