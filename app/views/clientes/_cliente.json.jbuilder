json.extract! cliente, :id, :nome_completo, :data_de_nascimento, :cpf, :email, :telefone, :logradouro, :complemento, :bairro, :cidade, :cep, :senha, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
