Given('Eu estou na pagina de cadastrar novo trabalhador') do
  visit '/trabalhadors/new'
  expect(page).to have_current_path('/trabalhadors/new')
end

When('Eu crio um trabalhador com nome_completo {string}, data_de_nascimento {string}, email {string}, telefone {string}, profissao {string}, senha {string}') do |nome_completo, data_de_nascimento, email, telefone, profissao, senha|
  visit '/trabalhadors/new'
  fill_in 'trabalhador[nome_completo]', :with => nome_completo
  fill_in 'trabalhador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'trabalhador[email]', :with => email
  fill_in 'trabalhador[telefone]', :with => telefone
  fill_in 'trabalhador[profissao]', :with => profissao
  fill_in 'trabalhador[senha]', :with => senha
  click_button 'Create Trabalhador'
end

Then('Eu vejo uma mensagem que o trabalhador {string} foi gerado') do |nome_completo|
  expect(page).to have_content(nome_completo)
end

Then('Eu vejo uma mensagem de erro') do
  expect(page).to have_no_content('Telefone para contato obrigatório precisa ter 11 digitos')
end


Given('Eu estou na pagina de trabalhador') do
  visit('/trabalhadors')
end

Given('o trabalhador com nome_completo {string}, data_de_nascimento {string}, email {string}, telefone {string}, profissao {string}, senha {string} existe') do |nome_completo, data_de_nascimento, email, telefone, profissao, senha|
  visit '/trabalhadors/new'
  fill_in 'trabalhador[nome_completo]', :with => nome_completo
  fill_in 'trabalhador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'trabalhador[email]', :with => email
  fill_in 'trabalhador[telefone]', :with => telefone
  fill_in 'trabalhador[profissao]', :with => profissao
  fill_in 'trabalhador[senha]', :with => senha
  click_button 'Create Trabalhador'
  expect(page).to have_content(email)
end

When('Eu clico em minha conta com email {string}') do |nome_completo|
  expect(page).to have_content(nome_completo)
  click_button "Destroy this trabalhador"
end

Then('Eu vejo uma mensagem que o trabalhador com email {string} foi excluido') do |email|
  expect(page).to have_no_content(email)
  expect(page).to have_current_path('/trabalhadors')
end

#EDITAR

When('eu estou na pagina de edicao de trabalhador com nome_completo {string}, data_de_nascimento {string}, email {string}, telefone {string}, profissao {string}, senha {string}') do |nome_completo, data_de_nascimento, email, telefone, profissao, senha|
  click_link 'Edit this trabalhador'
end

When('eu edito um usuario com trabalhador nome_completo {string}, data_de_nascimento {string}, email {string}, telefone {string}, profissao {string}, senha {string}') do |novonome, data_de_nascimento, email, telefone, profissao, senha|
  fill_in 'trabalhador[nome_completo]', :with => novonome
  fill_in 'trabalhador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'trabalhador[email]', :with => email
  fill_in 'trabalhador[telefone]', :with => telefone
  fill_in 'trabalhador[profissao]', :with => profissao
  fill_in 'trabalhador[senha]', :with => senha
end

When('eu clico em atualizar o trabalhador') do
  click_button 'Update Trabalhador'
end

Then('eu vejo uma mensagem que o trabalhador foi atualizado com sucesso') do
  expect(page).to have_content("Trabalhador was successfully updated")
end
