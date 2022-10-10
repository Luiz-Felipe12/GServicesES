Given('estou na pagina de cadastrar administrador') do
  visit '/administradors/new'
  expect(page).to have_current_path('/administradors/new')
end

When('eu preencho os campos com nome_completo {string}, data_de_nascimento {string},email {string}, telefone {string},senha {string}') do |nome_completo, data_de_nascimento, email, telefone, senha|
  visit '/administradors/new'
  fill_in 'administrador[nome_completo]', :with => nome_completo
  fill_in 'administrador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'administrador[email]', :with => email
  fill_in 'administrador[telefone]', :with => telefone
  fill_in 'administrador[senha]', :with => senha
end

When('clico em Cadastar novo administrador') do
  click_button 'Create Administrador'
end

Then('eu vejo uma mensagem informando que o administrador foi criado com sucesso') do
  expect(page).to have_content('Administrador was successfully created')
end
#começando outro

When('eu preencho os campos com nome_completo {string}, data_de_nascimento {string},email {string}, telefone {string}, senha {string}') do |nome_completo, data_de_nascimento, email, telefone, senha|
  visit '/administradors/new'
  fill_in 'administrador[nome_completo]', :with => ''
  fill_in 'administrador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'administrador[email]', :with => email
  fill_in 'administrador[telefone]', :with => telefone
  fill_in 'administrador[senha]', :with => senha
end

Then('eu vejo uma mensagem de erro informando que nao e possivel criar administrador sem nome') do
  expect(page).to have_content('Nome completo obrigatório Nome completo is invalid Nome completo is too short (minimum is 8 characters)')
end

#começando outra

Then('eu vejo uma mensagem de erro informando que nao e possivel criar administrador sem telefone') do
  expect(page).to have_content('Telefone Precisa ter 11 dígitos')
end

#começando outra

Given('Eu estou na pagina de administrador') do
  visit('/administradors')
end

Given('o administrador com nome_completo {string}, data_de_nascimento {string},email {string}, telefone {string},senha {string}') do |nome_completo, data_de_nascimento, email, telefone, senha|
  visit '/administradors/new'
  fill_in 'administrador[nome_completo]', :with => nome_completo
  fill_in 'administrador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'administrador[email]', :with => email
  fill_in 'administrador[telefone]', :with => telefone
  fill_in 'administrador[senha]', :with => senha
  click_button 'Create Administrador'
  expect(page).to have_content(email)
end

When('Eu clico em meu cadastro com email {string}') do |nome_completo|
  expect(page).to have_content(nome_completo)
  click_button "Apagar Administrador"
end

Then('Eu vejo uma mensagem que o administrador com email {string} foi excluido') do |email|
  expect(page).to have_no_content(email)
  expect(page).to have_current_path('/administradors')
end

#editar

Given('Eu estou na pagina de cadastrar novo administrador') do
  visit '/administradors/new'
  expect(page).to have_current_path('/administradors/new')
end

When('Eu crio um administrador com nome_completo  {string}, data_de_nascimento {string},email {string}, telefone {string},senha {string}') do |nome_completo, data_de_nascimento, email, telefone, senha|
  visit '/administradors/new'
  fill_in 'administrador[nome_completo]', :with => nome_completo
  fill_in 'administrador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'administrador[email]', :with => email
  fill_in 'administrador[telefone]', :with => telefone
  fill_in 'administrador[senha]', :with => senha
  click_button 'Create Administrador'
end

When('eu estou na pagina de edicao de administrador com nome_completo {string}, data_de_nascimento {string},email {string}, telefone {string},senha {string}') do |nome_completo, data_de_nascimento, email, telefone, senha|
  click_link 'Editar Administrador'
end

When('eu edito um usuario com administrador nome_completo {string}, data_de_nascimento {string},email {string}, telefone {string},senha {string}') do |nomenovo, data_de_nascimento, email, telefone, senha|
  fill_in 'administrador[nome_completo]', :with => nomenovo
  fill_in 'administrador[data_de_nascimento]', :with => data_de_nascimento
  fill_in 'administrador[email]', :with => email
  fill_in 'administrador[telefone]', :with => telefone
  fill_in 'administrador[senha]', :with => senha
end

When('eu clico em atualizar o administrador') do
  click_button 'Update Administrador'
end

Then('eu vejo uma mensagem que o administrador foi atualizado ccom sucesso') do
  expect(page).to have_content("Administrador was successfully updated")
end

