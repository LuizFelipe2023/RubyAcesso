class Pessoa < ApplicationRecord

      before_save :strip_mask  
      
      validates :nome, presence: true, length: {maximum:255}
      validates :telefone, presence: true, length: {maximum:20}
      validates :cpf , presence: true, length: {maximum:14}, uniqueness: true

      private

      def strip_mask
            self.cpf = cpf.gsub(/\D/, "") if cpf.present?
            self.telefone = telefone.gsub(/\D/, "") if telefone.present?
      end

      has_many :acessos, dependent: :destroy
end
