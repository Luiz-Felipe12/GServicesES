require "test_helper"

class ContratoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'criar contrato sem cliente' do
    cliente = Cliente.new nome_completo: 'Maria Carla',
                          data_de_nascimento: Time.zone.today,
                          cpf: ' ',
                          email: 'mariac@gmail.com',
                          telefone: '8722113344',
                          logradouro: 'avenida Santo Amaro',
                          complemento: 'primeiro andar',
                          bairro: 'Boa Vista',
                          cidade: 'Garanhuns',
                          cep: '11223345',
                          senha: '95124876000'
    assert_not cliente.save
    servico = Servico.new nome: 'Instalação de internet',
                          descricao: 'Instalar internet',
                          data: Time.zone.today,
                          horario_inicio: Time.zone.today,
                          horario_temino: Time.zone.today,
                          preco: 100.90
    assert_not servico.save
    contrato = Contrato.new servico_id: servico.id
    assert_not contrato.save
  end

  test 'criar contrato sem servico' do
    cliente = Cliente.new nome_completo: 'Roberto Cabral',
                          data_de_nascimento: Time.zone.today,
                          cpf: '74874574100',
                          email: 'rocabral@gmail.com',
                          telefone: '87922123344',
                          logradouro: 'avenida Santo Amaro',
                          complemento: 'primeiro andar',
                          bairro: 'Boa Vista',
                          cidade: 'Garanhuns',
                          cep: '11223345',
                          senha: '10001114478'
    assert cliente.save
    trabalhador = Trabalhador.new nome_completo: 'Marcia',
                                  data_de_nascimento: '1997-04-04',
                                  email:'marciam@gmail.com',
                                  telefone:'87987611121',
                                  profissao:'advogada',
                                  senha:'1234444'
    servico = Servico.new nome: 'Instalação de internet',
                          descricao: 'Instalar internet',
                          data: Time.zone.today,
                          horario_inicio: Time.zone.today,
                          horario_temino: Time.zone.today,
                          preco: 100.90,
                          trabalhador_id: trabalhador.id
    assert_not servico.save
    contrato = Contrato.new cliente_id: cliente.id
    assert_not contrato.save
  end

  test 'criar contrato com servico sem horarios' do
    trabalhador = Trabalhador.new nome_completo: 'Jurema',
                                  data_de_nascimento: '1997-04-04',
                                  email:'jurema@gmail.com',
                                  telefone:'87987611121',
                                  profissao:'advogada',
                                  senha:'1234445'
    servico = Servico.new nome: 'Escritorio de advocacia',
                          descricao: 'Advogar causas',
                          data: Time.zone.today,
                          horario_inicio: ' ',
                          horario_temino: ' ',
                          preco: 550.00,
                          trabalhador_id: trabalhador.id
    assert_not servico.save
    cliente = Cliente.new nome_completo: 'Roberto Cabral',
                          data_de_nascimento: Time.zone.today,
                          cpf: '74874574100',
                          email: 'rocabral@gmail.com',
                          telefone: '87922123344',
                          logradouro: 'avenida Santo Amaro',
                          complemento: 'primeiro andar',
                          bairro: 'Boa Vista',
                          cidade: 'Garanhuns',
                          cep: '11223345',
                          senha: '10001114478'
    contrato = Contrato.new cliente_id: cliente.id, servico_id: servico.id
    assert_not contrato.save
  end
end
