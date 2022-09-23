json.extract! servico, :id, :nome, :descricao, :data, :horario_inicio, :horario_temino, :preco, :trabalhador_id, :created_at, :updated_at
json.url servico_url(servico, format: :json)
