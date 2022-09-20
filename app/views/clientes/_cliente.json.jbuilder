json.extract! cliente, :id, :nome_completo, :data_de_nascimento, :email, :telefone, :cpf, :senha, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
