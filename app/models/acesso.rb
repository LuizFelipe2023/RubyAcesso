class Acesso < ApplicationRecord
  belongs_to :pessoa

  
  validates :assunto, presence: true
  validates :entrada, presence: true


  validate :saida_maior_que_entrada
  validate :nao_permitir_duas_entradas_sem_saida, on: :create

  private

  
  def saida_maior_que_entrada
    return if saida.blank? || entrada.blank?

    if saida < entrada
      errors.add(:saida, "não pode ser anterior à entrada")
    end
  end

  
  def nao_permitir_duas_entradas_sem_saida
    acesso_aberto = Acesso.exists?(
      pessoa_id: pessoa_id,
      saida: nil
    )

    if acesso_aberto
      errors.add(:base, "Essa pessoa já possui um acesso em aberto")
    end
  end
end
