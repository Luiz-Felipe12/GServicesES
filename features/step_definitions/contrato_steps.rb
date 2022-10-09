Given('estou na pagina de contrato') do
    visit '/contratos/new'
    expect(page).to have_content('New contrato')
end
  
When('existe cliente com nome_completo {string}, data de nascimento {string},cpf {string},email {string}, telefone {string}, logradouro {string}, complemento {string}, bairro {string}, cidade {string}, cep {string}, senha {string}') do | nome, data_nascimento, cpf, email, telefone, logradouro, complemento, bairro, cidade, cep, senha|
    visit '/clientes/new'
    fill_in 'cliente[nome_completo]',:with => nome
    fill_in 'cliente[data_de_nascimento]', :with => data_nascimento
    fill_in 'cliente[cpf]', :with  => cpf
    fill_in 'cliente[email]', :with => email
    fill_in 'cliente[telefone]', :with => telefone
    fill_in 'cliente[logradouro]', :with => logradouro
    fill_in 'cliente[complemento]', :with => complemento 
    fill_in 'cliente[bairro]', :with => bairro
    fill_in 'cliente[cidade]', :with => cidade
    fill_in 'cliente[cep]', :with => cep
    fill_in 'cliente[senha]', :with => senha
    click_button 'Create Cliente'
    expect(page).to have_content(nome)
end

Given('existe um trabalhador com nome_completo {string}, data_de_nascimento {string}, email {string}, telefone {string}, profissao {string}, senha {string}') do |nome_completo, data_de_nascimento, email, telefone, profissao, senha|
  visit '/trabalhadors/new'
  fill_in 'trabalhador[nome_completo]', :with => nome_completo
  fill_in 'trabalhador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'trabalhador[email]', :with => email
  fill_in 'trabalhador[telefone]', :with => telefone
  fill_in 'trabalhador[profissao]', :with => profissao
  fill_in 'trabalhador[senha]', :with => senha
  click_button 'Create Trabalhador'
  expect(page).to have_content(nome_completo)
end
    
When('existe um servico com nome {string}, descricao {string}, data {string}, horario_inicio {string}, horario_termino {string}, preco {string}') do |nome, descricao, data, horario_inicio, horario_termino, preco|
    visit '/servicos/new'
    fill_in 'servico[nome]',:with => nome
    fill_in 'servico[descricao]', :with => descricao
    fill_in 'servico[data]', :with  => data
    fill_in 'servico[horario_inicio]', :with => horario_inicio
    fill_in 'servico[horario_temino]', :with => horario_termino
    fill_in 'servico[preco]', :with => preco
    click_button 'Create Servico'
    expect(page).to have_content(nome)
end

    
When('eu preencho o contrato com o cliente de id {string} e servico de id {string}') do |id1, id2|
    visit '/contratos/new'
    fill_in 'contrato[cliente_id]', :with => id1
    fill_in 'contrato[servico_id]', :with => id2
end
    
When('eu clico em criar contrato') do
     click_button 'Create Contrato'
end
    
Then('vejo uma mensagem que o contrato foi criado com sucesso') do
    expect(page).to have_content('Contrato was successfully created.')
end

  
Then('vejo uma mensagem de erro informando que o cliente nao existe e o contrato nao foi criado') do
   expect(page).to have_content("Cliente must exist")
end

Then('vejo uma mensagem de erro informando que o servico nao existe e o contrato nao foi criado') do
    expect(page).to have_content("Servico must exist")
end

When('eu clico em apagar o contrato de servico de nome {string}') do |nome|
    visit '/servicos'
    click_link 'Show this servico'
    expect(page).to have_content(nome)
    click_button 'Destroy this servico'
end
  
Then('eu vejo uma mensagem informando que o contrato foi apagado com sucesso') do
    expect(page).to have_content("Servico was successfully destroyed.")
end
  

  
