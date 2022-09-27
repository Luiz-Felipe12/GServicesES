require "test_helper"

class TrabalhadorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @trabalhador = Trabalhador.new(nome_completo:'Jose Barbosa Silva', data_de_nascimento: Time.zone.today,email:'josebarbosa@gmail.com',telefone:'87987654321', profissao:'Auxiliar de Limpeza', senha:'12345678')
  end

  test 'trabalhador valido' do
    assert @trabalhador.valid?
  end

  test 'trabalhador sem nome' do
    @trabalhador.nome_completo = " "
    assert_not @trabalhador.valid?
  end

  test 'trabalhador sem profissao' do
    @trabalhador.profissao = " "
    assert_not @trabalhador.valid?
  end
end
