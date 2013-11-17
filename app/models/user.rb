class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def nota_para_o_produto(produto)

    nota = Nota.select(:nota).where(user: self, produto: produto).take

    if nota.nil?
      ""
    else
      nota.nota
    end

  end

end
