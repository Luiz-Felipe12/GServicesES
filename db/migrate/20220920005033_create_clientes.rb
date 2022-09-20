class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :nome_completo
      t.date :data_de_nascimento
      t.string :email
      t.string :telefone
      t.string :cpf
      t.string :senha

      t.timestamps
    end
  end
end
