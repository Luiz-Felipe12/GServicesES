class Servico < ApplicationRecord
  belongs_to :trabalhador
  has_many :contratoes
end
