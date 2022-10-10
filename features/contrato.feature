Feature: Contrato
    As Cliente
    I want to criar, editar, remover e visualizar meu contrato
    So that eu possa manter atualizado meu contrato

Scenario: Criar um novo contrato corretamente
    Given estou na pagina de contrato
    And existe cliente com nome_completo 'cliente testes', data de nascimento '24/09/1999',cpf '69335817665',email 'clienteTeste2@gmail.com', telefone '55383295538', logradouro 'Rua two', complemento 'numero 135, AP', bairro 'CohabbTwo', cidade 'Garanhuns', cep '88888888', senha '12845'
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And existe um servico com nome 'servico teste', descricao 'servico comum teste', data '31/10/2022', horario_inicio '10:00', horario_termino '12:00', preco '150.00'
    When eu preencho o contrato com o cliente de nome 'cliente testes' e servico de nome 'servico teste'
    And eu clico em criar contrato
    Then vejo uma mensagem que o contrato foi criado com sucesso

Scenario: Apagar um contrato
    Given estou na pagina de contrato
    And existe cliente com nome_completo 'cliente testes', data de nascimento '24/09/1999',cpf '69335817665',email 'clienteTeste2@gmail.com', telefone '55383295538', logradouro 'Rua two', complemento 'numero 135, AP', bairro 'CohabbTwo', cidade 'Garanhuns', cep '88888888', senha '12845'
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And existe um servico com nome 'servico teste', descricao 'servico comum teste', data '31/10/2022', horario_inicio '10:00', horario_termino '12:00', preco '150.00'
    When eu preencho o contrato com o cliente de nome 'cliente testes' e servico de nome 'servico teste'
    And eu clico em criar contrato
    When eu clico em apagar o contrato de servico 
    Then eu vejo uma mensagem informando que o contrato foi apagado com sucesso

Scenario: Criar um novo contrato sem cliente
    Given estou na pagina de contrato
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And existe um servico com nome 'servico teste', descricao 'servico comum teste', data '31/10/2022', horario_inicio '10:00', horario_termino '12:00', preco '150.00'
    When eu preencho o contrato com o servico de nome 'servico teste'
    And eu clico em criar contrato
    Then vejo uma mensagem de erro informando que o cliente nao existe e o contrato nao foi criado

Scenario: Editar um contrato
    Given estou na pagina de contrato
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '04/04/1997', email 'rodrigo@gmail.com', telefone '87981532876', profissao 'jardineiro', senha '6658745' 
    And existe um servico com nome 'Limpeza geral', descricao 'Servico de limpeza', data '31/10/2022', horario_inicio '16:50', horario_termino '17:50', preco '99.65'
    And  existe um servico com nome 'Limpeza geral two', descricao 'Servico de limpeza two', data '30/10/2022', horario_inicio '15:50', horario_termino '16:50', preco '95.65'
    And existe cliente com nome_completo 'clinte teste', data de nascimento '27/09/1999',cpf '69331817665',email 'clienteTeste@gmail.com', telefone '53383295538', logradouro 'Rua treze', complemento 'numero 133, AP', bairro 'Cohabbb', cidade 'Garanhuns', cep '88888888', senha '12345' 
    When eu preencho o contrato com o cliente de nome 'clinte teste' e servico de nome 'Limpeza geral two'
    And eu clico em criar contrato
    And vejo uma mensagem que o contrato foi criado com sucesso
    When eu mudo o servico contratado para 'Limpeza geral'
    And clico em atualizar contrato
    Then eu vejo uma mensagem de que o servico foi editado

Scenario: Criar um novo contrato sem um servico 
    Given estou na pagina de contrato
    And existe cliente com nome_completo 'cliente testes', data de nascimento '24/09/1999',cpf '69335817665',email 'clienteTeste2@gmail.com', telefone '55383295538', logradouro 'Rua two', complemento 'numero 135, AP', bairro 'CohabbTwo', cidade 'Garanhuns', cep '88888888', senha '12845'
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    When eu preencho o contrato com o cliente de nome 'cliente testes'
    And eu clico em criar contrato
    Then vejo uma mensagem de erro informando que o servico nao existe e o contrato nao foi criado
