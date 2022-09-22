class Trabalhador < ApplicationRecord

  has_many :servicos, dependent: :destroy
  has_many :contratoes, through: :servicos

  validates :nome_completo, presence: {message: 'Nome completo obrigatório'}, format: {with: /\A[a-zA-Z]/}, length: {minimum: 8, maximum: 80}
  validates :data_de_nascimento, presence: {message: 'Data de nascimento obrigatória'}
  validates :email, presence: {message: 'E-mail obrigatório'}, format: {with: URI:: MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :telefone, presence: {message: 'Telefone para contato obrigatório'}, length: {is: 11, message: 'Precisa ter 11 dígitos'}
  validates :profissao, presence: {message: 'Campo Profissão obrigatório'}, length: {maximum: 40}
  validates :senha, presence: {message: 'Senha obrigatória'}, length: {minumum: 5, maximum: 20}, uniqueness: true

end
