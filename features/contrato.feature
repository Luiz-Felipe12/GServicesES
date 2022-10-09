Feature: Contrato
    As Cliente
    I want to criar, editar, remover e visualizar meu contrato
    So that eu possa manter atualizado meu contrato

Scenario: Criar um novo contrato corretamente
    Given estou na pagina de contrato
    And existe cliente com nome_completo 'cliente testes', data de nascimento '24/09/1999',cpf '69335817665',email 'clienteTeste2@gmail.com', telefone '55383295538', logradouro 'Rua two', complemento 'numero 135, AP', bairro 'CohabbTwo', cidade 'Garanhuns', cep '88888888', senha '12845'
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And existe um servico com nome 'servico teste', descricao 'servico comum teste', data '31/10/2022', horario_inicio '10:00', horario_termino '12:00', preco '150.00'
    When eu preencho o contrato com o cliente de id '1' e servico de id '1'
    And eu clico em criar contrato
    Then vejo uma mensagem que o contrato foi criado com sucesso

Scenario: Criar um novo contrato com um cliente inexistente
    Given estou na pagina de contrato
    And existe cliente com nome_completo 'cliente anonimo', data de nascimento '29/09/1999',cpf '69345817675',email 'clienteTeste2@gmail.com', telefone '55384295538', logradouro 'Rua two', complemento 'numero 155, AP', bairro 'CohabbTwo', cidade 'Garanhuns', cep '87888888', senha '12855'
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And existe um servico com nome 'servico teste', descricao 'servico comum teste', data '31/10/2022', horario_inicio '10:00', horario_termino '12:00', preco '150.00'
    When eu preencho o contrato com o cliente de id '4' e servico de id '1'
    And eu clico em criar contrato
    Then vejo uma mensagem de erro informando que o cliente nao existe e o contrato nao foi criado

Scenario: Criar um novo contrato com um servico inexistente
    Given estou na pagina de contrato
    And existe cliente com nome_completo 'cliente testes', data de nascimento '24/09/1999',cpf '69335817665',email 'clienteTeste2@gmail.com', telefone '55383295538', logradouro 'Rua two', complemento 'numero 135, AP', bairro 'CohabbTwo', cidade 'Garanhuns', cep '88888888', senha '12845'
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And existe um servico com nome '', descricao 'servico comum teste', data '31/10/2022', horario_inicio '10:00', horario_termino '12:00', preco '150.00'
    When eu preencho o contrato com o cliente de id '1' e servico de id '4'
    And eu clico em criar contrato
    Then vejo uma mensagem de erro informando que o servico nao existe e o contrato nao foi criado

Scenario: Criar um novo contrato sem cliente
    Given estou na pagina de contrato
    And existe cliente com nome_completo '', data de nascimento '24/09/1999',cpf '69335817665',email 'clienteTeste2@gmail.com', telefone '55383295538', logradouro 'Rua two', complemento 'numero 135, AP', bairro 'CohabbTwo', cidade 'Garanhuns', cep '88888888', senha '12845'
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And existe um servico com nome '', descricao 'servico comum teste', data '31/10/2022', horario_inicio '10:00', horario_termino '12:00', preco '150.00'
    When eu preencho o contrato com o cliente de id '1' e servico de id '4'
    And eu clico em criar contrato
    Then vejo uma mensagem de erro informando que o cliente nao existe e o contrato nao foi criado

Scenario: Apagar um contrato
    Given estou na pagina de contrato
    And existe cliente com nome_completo 'cliente testes', data de nascimento '24/09/1999',cpf '69335817665',email 'clienteTeste2@gmail.com', telefone '55383295538', logradouro 'Rua two', complemento 'numero 135, AP', bairro 'CohabbTwo', cidade 'Garanhuns', cep '88888888', senha '12845'
    And existe um trabalhador com nome_completo 'Rodrigo Silva', data_de_nascimento '10/12/1979', email 'rodrigoze@gmail.com', telefone '87987654321', profissao 'Auxiliar de Limpeza', senha '123456'
    And existe um servico com nome 'servico teste', descricao 'servico comum teste', data '31/10/2022', horario_inicio '10:00', horario_termino '12:00', preco '150.00'
    When eu clico em apagar o contrato de servico de nome 'servico teste' 
    Then eu vejo uma mensagem informando que o contrato foi apagado com sucesso

