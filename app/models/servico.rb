class Servico < ApplicationRecord
  belongs_to :trabalhador
  has_many :contratoes

  validates :nome, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
end
