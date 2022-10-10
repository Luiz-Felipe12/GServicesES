Given('estou na pagina de cadastrar cliente') do
  visit '/clientes/new'
  expect(page).to have_current_path ('/clientes/new')
  
end

When('eu preencho os campos com nome {string}, data de nascimento {string},cpf {string},email {string}, telefone {string}, logradouro {string}, complemento {string}, bairro {string}, cidade {string}, cep {string}, senha {string}') do |nome, data, cpf, email, telefone, logradouro, complemento,bairro, cidade,cep,senha|
  fill_in 'cliente[nome_completo]',:with => nome
  fill_in 'cliente[data_de_nascimento]', :with => data
  fill_in 'cliente[cpf]', :with  => cpf
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[telefone]', :with => telefone
  fill_in 'cliente[logradouro]', :with => logradouro
  fill_in 'cliente[complemento]', :with => complemento 
  fill_in 'cliente[bairro]', :with => bairro
  fill_in 'cliente[cidade]', :with => cidade
  fill_in 'cliente[cep]', :with => cep
  fill_in 'cliente[senha]', :with => senha
end

When('clico em Cadastar novo cliente') do
  click_button 'Create Cliente'
end

Then('eu vejo uma mensagem informando que o cliente foi criado com sucesso') do
  expect(page).to have_content('Cliente was successfully created')
end

Then('eu vejo uma mensagem de erro informando que nao e possivel criar cliente sem nome') do
  expect(page).to have_content('Nome completo obrigatório Nome completo is invalid Nome completo is too short (minimum is 8 characters)')
end

Given('estou na pagina de cliente') do
  visit '/clientes/new'
end

When('existe cliente com nome {string}, data de nascimento {string},cpf {string},email {string}, telefone {string}, logradouro {string}, complemento {string}, bairro {string}, cidade {string}, cep {string}, senha {string}') do |nome, data, cpf, email, telefone, logradouro, complemento,bairro, cidade,cep,senha|
    fill_in 'cliente[nome_completo]',:with => nome
    fill_in 'cliente[data_de_nascimento]', :with => data
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

Then('eu vejo uma mensagem de erro informando que nao e possivel criar cliente sem telefone') do
  expect(page).to have_content('Telefone Precisa ter 11 dígitos Bairro')
end

When('eu entro na pagina de clientes') do
  visit '/clientes/new'
end

When('clico em apagar cliente com o nome {string}') do |cliente|
  #visit '/clientes'
  #click_link 'Mostrar esse Cliente'
  expect(page).to have_content(cliente)
  click_button 'Apagar esse Cliente'
  
end

Then('vejo uma mensagem informando que o cliente foi removido do sistema') do
  expect(page).to have_content('Cliente was successfully destroyed')
end

When('clico em editar cliente com nome {string}') do |cliente|
  #visit '/clientes'
  #click_link 'Mostrar esse Cliente'
  expect(page).to have_content(cliente)
  click_link 'Editar esse Cliente'
end

When('edito os dados com nome {string}, email {string}, logradouro {string}, complemento {string}') do |nome, email, logradouro, complemento|
  fill_in 'cliente[nome_completo]',:with => nome
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[logradouro]', :with => logradouro
  fill_in 'cliente[complemento]', :with => complemento
end


When('clico em atualizar cliente') do
  click_button 'Update Cliente'
end

Then('vejo uma mensagem informando que o cliente foi atualizado com sucesso') do
  expect(page).to have_content('Cliente was successfully updated')
end