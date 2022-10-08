require "test_helper"

class ServicoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'servico sem horarios' do
    trabalhador = Trabalhador.new nome_completo: 'Teste teste',
                                  data_de_nascimento: '1997-04-04',
                                  email:'teste@gmail.com',
                                  telefone:'87987654321',
                                  profissao:'limpador',
                                  senha:'123456'
    assert trabalhador.save
    servico = Servico.new nome:'Jardinagem',
                          descricao:'Serviço completo de Jardinagem',
                          data:DateTime.now,
                          horario_inicio: ' ',
                          horario_temino: ' ',
                          preco: 150.00,
                          trabalhador_id: trabalhador.id
    assert_not servico.save
  end

  test 'servico sem trabalhador' do
    trabalhador = Trabalhador.new nome_completo: 'Teste teste',
                                  data_de_nascimento: '1997-04-04',
                                  email:'',
                                  telefone:'87987654321',
                                  profissao:'limpador',
                                  senha:'123456'
    servico = Servico.new nome:'Jardinagem',
                          descricao:'Serviço completo de Jardinagem',
                          data:Time.zone.today,
                          horario_inicio: '2022-10-08 12:30:00 UTC',
                          horario_temino: '2022-10-08 13:30:00 UTC',
                          preco: 150.00
    assert_not servico.save
  end

  test 'servico sem descricao' do
    trabalhador = Trabalhador.new(nome_completo: 'Teste teste',
                                  data_de_nascimento: '04-04-1997',
                                  email:'teste@gmail.com',
                                  telefone:'87987654321',
                                  profissao:'limpador',
                                  senha:'123456' )
    assert trabalhador.save
    servico = Servico.new(nome:'Jardinagem',
                          descricao:' ',
                          data:Time.zone.today,
                          horario_inicio:Time.zone.today,
                          horario_temino:Time.zone.today,
                          preco: 150.00,
                          trabalhador_id: trabalhador.id)
    assert_not servico.save
  end
end
