json.extract! administrador, :id, :nome_completo, :data_de_nascimento, :email, :telefone, :senha, :created_at, :updated_at
json.url administrador_url(administrador, format: :json)
