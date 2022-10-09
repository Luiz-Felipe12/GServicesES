Given('Eu estou na pagina de cadastrar um servico') do
  visit '/servicos'
end

Given('O trabalhador com nome_completo {string}, data_de_nascimento {string}, email {string}, telefone {string}, profissao {string}, senha {string} existe') do |nome_completo, data_de_nascimento, email, telefone, profissao, senha|
  visit '/trabalhadors/new'
  fill_in 'trabalhador[nome_completo]', :with => nome_completo
  fill_in 'trabalhador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'trabalhador[email]', :with => email
  fill_in 'trabalhador[telefone]', :with => telefone
  fill_in 'trabalhador[profissao]', :with => profissao
  fill_in 'trabalhador[senha]', :with => senha
  click_button 'Create Trabalhador'
end


When('Eu crio um servico com nome {string}, descricao {string}, data {string}, horario_inicio {string}, horario_temino {string}, preco {string}') do |nome, descricao, data, horario_inicio, horario_temino, preco|
  visit ('/servicos/new')
  fill_in 'servico[nome]', :with => nome
  fill_in 'servico[descricao]', :with => descricao
  fill_in 'servico[data]', :with => data
  fill_in 'servico[horario_inicio]', :with => horario_inicio
  fill_in 'servico[horario_temino]', :with => horario_temino
  fill_in 'servico[preco]', :with => preco
end

When('Eu clico em cadastrar novo servico') do
  click_button 'Create Servico'
end

Then('Eu vejo uma mensagem que o servico foi criado') do
  expect(page).to have_content('Servico was successfully created.')
end

Then('Eu vejo uma mensagem que o servico nao foi criado') do
  expect(page).to have_content("Nome can't be blank Nome is too short (minimum is 3 characters) Nome Use apenas letras")
end
Then('Eu vejo uma mensagem que o servico nao foi criado por causa da descricao vazia') do
  expect(page).to have_content("Descricao can't be blank Descricao is too short (minimum is 1 character) Descricao Use apenas letras")
end

Then('Eu vejo uma mensagem que o servico nao foi criado por causa do preco vazio') do
  expect(page).to have_content("Preco can't be blank Preco is too short (minimum is 1 character) Preco Use apenas numeros e ponto")
end

#Deletar

Given('Eu estou na pagina de servico') do
  visit '/servicos'
end

Given('um servico com nome {string}, descricao {string}, data {string}, horario_inicio {string}, horario_temino {string}, preco {string}') do |nome, descricao, data, horario_inicio, horario_temino, preco|
  visit '/servicos/new'
  fill_in 'servico[nome]', :with => nome
  fill_in 'servico[descricao]', :with => descricao
  fill_in 'servico[data]', :with => data
  fill_in 'servico[horario_inicio]', :with => horario_inicio
  fill_in 'servico[horario_temino]', :with => horario_temino
  fill_in 'servico[preco]', :with => preco
  click_button 'Create Servico'
  expect(page).to have_content(nome)
end

When('Eu clico em servico nome {string}') do |nome|
  expect(page).to have_content(nome)
  click_button "Destroy this servico"
end

Then('Eu vejo uma mensagem que o servico foi excluido') do
  expect(page).to have_content('Servico was successfully destroyed')
  expect(page).to have_current_path('/servicos')
end

