require "test_helper"

class AdministradorTest < ActiveSupport::TestCase

  test 'Salvando administrador com dados validos' do
    administrador = Administrador.new nome_completo: 'Luiz Felipe Ferr',
                        data_de_nascimento: Time.zone.today,
                        email: 'luizfelipeghg.ssu@gmail.com',
                        telefone:'40028922222',
                        senha:'123456789'


    assert administrador.save
  end
end
