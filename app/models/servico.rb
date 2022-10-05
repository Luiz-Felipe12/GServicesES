class Servico < ApplicationRecord
  belongs_to :trabalhador
  has_many :contratos
end
