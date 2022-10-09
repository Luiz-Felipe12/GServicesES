Feature: Servico
  As a trabalhador
  I want to cadastrar, visualizar, atualizar e remover servicos prestados
  So that eu possa atender as pessoas e ganhar um salario

  Scenario: Cadastrar um novo servico
    Given Eu estou na pagina de cadastrar um servico
    And O trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '04/04/1997', email 'rodrigo@gmail.com', telefone '87981532876', profissao 'jardineiro', senha '6658745' existe
    When Eu crio um servico com nome 'Limpeza geral', descricao 'Servico de limpeza', data '31/10/2022', horario_inicio '16:50', horario_temino '17:50', preco '99.65'
    And Eu clico em cadastrar novo servico
    Then Eu vejo uma mensagem que o servico foi criado

  Scenario: Cadastrar servico com nome vazio
    Given Eu estou na pagina de cadastrar um servico
    And O trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '04/04/1997', email 'rodrigo@gmail.com', telefone '87981532876', profissao 'jardineiro', senha '6658745' existe
    When Eu crio um servico com nome '', descricao 'Servico de limpeza', data '31/10/2022', horario_inicio '16:50', horario_temino '17:50', preco '99.65'
    And Eu clico em cadastrar novo servico
    Then Eu vejo uma mensagem que o servico nao foi criado

  Scenario: Cadastrar servico com descricao vazia
    Given Eu estou na pagina de cadastrar um servico
    And O trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '04/04/1997', email 'rodrigo@gmail.com', telefone '87981532876', profissao 'jardineiro', senha '6658745' existe
    When Eu crio um servico com nome 'Limpeza geral', descricao '', data '31/10/2022', horario_inicio '16:50', horario_temino '17:50', preco '99.65'
    And Eu clico em cadastrar novo servico
    Then Eu vejo uma mensagem que o servico nao foi criado por causa da descricao vazia

  Scenario: Cadastrar servico com preco vazio
    Given Eu estou na pagina de cadastrar um servico
    And O trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '04/04/1997', email 'rodrigo@gmail.com', telefone '87981532876', profissao 'jardineiro', senha '6658745' existe
    When Eu crio um servico com nome 'Limpeza geral', descricao 'Servico de limpeza', data '31/10/2022', horario_inicio '16:50', horario_temino '17:50', preco ''
    And Eu clico em cadastrar novo servico
    Then Eu vejo uma mensagem que o servico nao foi criado por causa do preco vazio

  Scenario: Deletar um servico
    Given Eu estou na pagina de servico
    And o trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456' existe
    And um servico com nome 'Limpeza geral', descricao 'Servico de limpeza', data '31/10/2022', horario_inicio '16:50', horario_temino '17:50', preco '99.65'
    When Eu clico em servico nome 'Limpeza geral'
    Then Eu vejo uma mensagem que o servico foi excluido