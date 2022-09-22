class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :nome_completo
      t.date :data_de_nascimento
      t.string :cpf
      t.string :email
      t.string :telefone
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :cep
      t.string :senha

      t.timestamps
    end
  end
end
