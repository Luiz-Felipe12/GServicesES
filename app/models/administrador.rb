class Administrador < ApplicationRecord

  validates :nome_completo, presence: {message: 'Nome completo obrigatório'}, format: {with: /\A[a-zA-Z ]+\Z/}, length: {minimum: 8, maximum: 80}
  validates :data_de_nascimento, presence: {message: 'Data de nascimento obrigatória'}
  validates :email, presence: {message: 'E-mail obrigatório'}, format: {with: URI:: MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :telefone, presence: {message: 'Telefone para contato obrigatório'}, length: {is: 11, message: 'Precisa ter 11 dígitos'}
  validates :senha, presence: {message: 'Senha obrigatória'}, length: {minumum: 5, maximum: 20}, uniqueness: true

  validate :valida_data

  def valida_data
    if data_de_nascimento.present? && data_de_nascimento > Time.zone.today
      errors.add(:data_de_nascimento, "A data deve ser a de hoje ou anterior")
    end
  end

end
