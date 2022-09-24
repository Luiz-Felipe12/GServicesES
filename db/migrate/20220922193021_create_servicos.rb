class CreateServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :servicos do |t|
      t.string :nome
      t.text :descricao
      t.date :data
      t.time :horario_inicio
      t.time :horario_temino
      t.string :preco
      t.references :trabalhador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
