require "test_helper"

class ClienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @cliente = Cliente.new(nome_completo:'Mauricio Lopes',
                           data_de_nascimento: Time.zone.today,
                           cpf: '11223344556',
                           email: 'mauricio@gmail.com',
                           telefone: '87987562145',
                           logradouro: 'rua da madeira',
                           complemento: 'casa',
                           bairro: 'Centro',
                           cidade: 'Garanhuns',
                           cep: '00111222',
                           senha: '11554896')
  end

  test 'salvar cliente com dados validos' do
    assert @cliente.valid?
  end

  test 'salvar cliente com telefone incorreto' do
    cliente = Cliente.new nome_completo: 'Maria José',
                          data_de_nascimento: Time.zone.today,
                          cpf: '00221154822',
                          email: 'mariaj@gmail.com',
                          telefone: '8722113344',
                          logradouro: 'avenida Santo Amaro',
                          complemento: 'primeiro andar',
                          bairro: 'Boa Vista',
                          cidade: 'Garanhuns',
                          cep: '11223345',
                          senha: '951248762154'
    assert_not cliente.save
  end

  test 'salvar cliente com email existente' do
    cliente = Cliente.new nome_completo: 'Maria José Oliveira',
                          data_de_nascimento: Time.zone.today,
                          cpf: '84955787544',
                          email: 'mariaj@gmail.com',
                          telefone: '8722113344',
                          logradouro: 'rua Carlos de Andrade',
                          complemento: 'casa',
                          bairro: 'Centro',
                          cidade: 'Garanhuns',
                          cep: '11224455',
                          senha: '762154951248'
    assert_not cliente.save
  end
end
