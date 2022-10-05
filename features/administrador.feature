Feature: Autenticacao
  As a administrador
  I want to criar, editar, remover o administrador
  So that eu possa manter os dados do administrador do sistema atualizado

  Scenario: Cadastar novo administrador corretamente
    Given estou na pagina de cadastrar administrador
    When eu preencho os campos com nome_completo 'administrador teste', data_de_nascimento '27/09/1999',email 'admTeste@gmail.com', telefone '53383295539',senha '1234567'
    And clico em Cadastar novo administrador
    Then eu vejo uma mensagem informando que o administrador foi criado com sucesso

  Scenario: Cadastar novo administrador sem nome
    Given estou na pagina de cadastrar administrador
    When eu preencho os campos com nome_completo '', data_de_nascimento '27/09/1999',email 'admTeste@gmail.com', telefone '53383295539', senha '1234567'
    And clico em Cadastar novo administrador
    Then eu vejo uma mensagem de erro informando que nao e possivel criar administrador sem nome

  Scenario: Cadastar novo administrador sem telefone
    Given estou na pagina de cadastrar administrador
    When eu preencho os campos com nome_completo 'teste administrador', data_de_nascimento '27/09/1999',email 'clienteTeste@gmail.com', telefone '', senha '12345'
    And clico em Cadastar novo administrador
    Then eu vejo uma mensagem de erro informando que nao e possivel criar administrador sem telefone

  Scenario: Deletar um administrador
    Given Eu estou na pagina de administrador
    And o administrador com nome_completo 'administrador teste', data_de_nascimento '27/09/1999',email 'admTeste@gmail.com', telefone '53383295539',senha '1234567'
    When Eu clico em meu cadastro com email 'admTeste@gmail.com'
    Then Eu vejo uma mensagem que o administrador com email 'admTeste@gmail.com' foi excluido

  Scenario: Editar nome administrador
    Given Eu estou na pagina de cadastrar novo administrador
    When Eu crio um administrador com nome_completo  'administrador teste', data_de_nascimento '27/09/1999',email 'admTeste@gmail.com', telefone '53383295539',senha '1234567'
    And eu estou na pagina de edicao de administrador com nome_completo 'administrador teste', data_de_nascimento '27/09/1999',email 'admTeste@gmail.com', telefone '53383295539',senha '1234567'
    And eu edito um usuario com administrador nome_completo 'administrador', data_de_nascimento '27/09/1999',email 'admTeste@gmail.com', telefone '53383295539',senha '1234567'
    And eu clico em atualizar o administrador
    Then eu vejo uma mensagem que o administrador foi atualizado ccom sucesso