Feature: Trabalhador
  As a trabalhador
  I want to me cadastrar, visualizar, atualizar e remover meus dados no sistema
  So that eu possa ter acesso as funcionalidades ou sair do sistema

  Scenario: Criar um novo trabalhador
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    Then Eu vejo uma mensagem que o trabalhador 'Rodrigo Silva' foi gerado

  Scenario: Criar um trabalhador com telefone invalido
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nome_completo 'Regina Silva', data_de_nascimento '10/12/1979', email 'reginasilva@gmail.com', telefone '879876543', profissao 'Auxiliar de Limpeza', senha '123456'
    Then  Eu vejo uma mensagem de erro

  Scenario: Criar um trabalhador com nome invalido
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nome_completo '123', data_de_nascimento '10/12/1979', email 'reginasilva@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    Then  Eu vejo uma mensagem de erro por causa do nome

  Scenario: Deletar um trabalhador
    Given Eu estou na pagina de trabalhador
    And o trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456' existe
    When Eu clico em minha conta com email 'rodrigoze@gmail.com'
    Then Eu vejo uma mensagem que o trabalhador foi excluido

  Scenario: Editar nome trabalhador
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And eu estou na pagina de edicao de trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And eu edito um usuario com trabalhador nome_completo 'Rodrigo Bezerra', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And eu clico em atualizar o trabalhador
    Then eu vejo uma mensagem que o trabalhador foi atualizado com sucesso
