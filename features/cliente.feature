Feature: Cliente
    As a cliente desse sistema
    I want to criar, editar, remover e visualizar meu cadastro
    So that eu possa manter atualizado meu cadastro

Scenario: Cadastar novo cliente corretamente
    Given estou na pagina de cadastrar cliente
    When eu preencho os campos com nome 'clinte teste', data de nascimento '27/09/1999',cpf '69331817665',email 'clienteTeste@gmail.com', telefone '53383295538', logradouro 'Rua treze', complemento 'numero 133, AP', bairro 'Cohabbb', cidade 'Garanhuns', cep '88888888', senha '12345'
    And clico em Cadastar novo cliente
    Then eu vejo uma mensagem informando que o cliente foi criado com sucesso

Scenario: Cadastar novo cliente sem nome
    Given estou na pagina de cadastrar cliente
    When eu preencho os campos com nome '', data de nascimento '27/09/1999',cpf '69331817665',email 'clienteTeste@gmail.com', telefone '53383295538', logradouro 'Rua treze', complemento 'numero 133, AP', bairro 'Cohabbb', cidade 'Garanhuns', cep '88888888', senha '12345'
    And clico em Cadastar novo cliente
    Then eu vejo uma mensagem de erro informando que nao e possivel criar cliente sem nome

Scenario: Cadastar novo cliente sem telefone
    Given estou na pagina de cadastrar cliente
    When eu preencho os campos com nome 'teste cliente', data de nascimento '27/09/1999',cpf '69331817665',email 'clienteTeste@gmail.com', telefone '', logradouro 'Rua treze', complemento 'numero 133, AP', bairro 'Cohab2', cidade 'Garanhuns', cep '88888888', senha '12345'
    And clico em Cadastar novo cliente
    Then eu vejo uma mensagem de erro informando que nao e possivel criar cliente sem telefone

Scenario: remover cadastro de cliente
    Given estou na pagina de cliente
    When eu entro na pagina de clientes
    And existe cliente com nome 'cliente teste', data de nascimento '27/09/1999',cpf '69331817665',email 'cliente1@gmail.com', telefone '53383295538', logradouro 'Rua seis', complemento 'numero 12, casa', bairro 'Cohabhhfhg', cidade 'Garanhuns', cep '88888888', senha '12345'
    When clico em apagar cliente com o nome 'cliente teste'
    Then vejo uma mensagem informando que o cliente foi removido do sistema 

Scenario: editar cadastro de cliente corretamente
    Given estou na pagina de cliente
    And existe cliente com nome 'cliente teste', data de nascimento '27/09/1999',cpf '69331817665',email 'clienteTeste@gmail.com', telefone '53383295538', logradouro 'Rua treze', complemento 'numero 133, AP', bairro 'CohabTwo', cidade 'Garanhuns', cep '88888888', senha '12345'
    When clico em editar cliente com nome 'cliente teste'
    And edito os dados com nome 'cliente teste one', email 'cliente1@gmail.com', logradouro 'Rua seis', complemento 'numero 12, casa'
    When clico em atualizar cliente
    Then vejo uma mensagem informando que o cliente foi atualizado com sucesso

