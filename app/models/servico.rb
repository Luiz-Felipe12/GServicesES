class Servico < ApplicationRecord
  belongs_to :trabalhador
  has_many :contratoes

  validates :nome, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates :descricao, presence: true, length: {in: 1..150}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates :data, presence: true
  validate :data_valida
  validates :horario_inicio, presence: true
  validate :horarioI
  validates :horario_temino, presence: true
  validate :horarioT
  validates :preco, presence: true, length: {in: 1..100}, format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "Use apenas numeros e ponto"}



  def data_valida
    if data.present? && data < Time.zone.today
      errors.add(:data, " não pode ser uma data no passado")
    end
  end

  def horarioI
    if horario_inicio.present? && horario_inicio < Time.now && data <= Time.zone.today
      errors.add(:horario_inicio, "O horário precisa ser atual")
    end
  end

  def horarioT
    if horario_temino.present? && horario_temino < horario_inicio && data <= Time.zone.today
      errors.add(:horario_temino, "Horario de servico invalido")
    end
  end

end
