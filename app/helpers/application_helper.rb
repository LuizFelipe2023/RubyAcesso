module ApplicationHelper

  def format_cpf(cpf)
    return "" if cpf.blank?
    cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\\1.\\2.\\3-\\4')
  end

 
  def format_telefone(numero)
    return "" if numero.blank?
    numero = numero.gsub(/\D/, '')
    if numero.length == 11
      numero.gsub(/(\d{2})(\d{5})(\d{4})/, '(\\1) \\2-\\3')
    elsif numero.length == 10
      numero.gsub(/(\d{2})(\d{4})(\d{4})/, '(\\1) \\2-\\3')
    else
      numero
    end
  end
  
end
