class Endereco < ApplicationRecord
  belongs_to :administrador
  belongs_to :cliente
  belongs_to :trabalhador
end
