class CreateAcessos < ActiveRecord::Migration[8.1]
  def change
    create_table :acessos do |t|
      t.string :assunto
      t.references :pessoa, null: false, foreign_key: true
      t.datetime :entrada
      t.datetime :saida

      t.timestamps
    end
  end
end
