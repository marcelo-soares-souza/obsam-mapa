class CreateDispositivos < ActiveRecord::Migration[5.0]
  def change
    create_table :dispositivos do |t|
      t.string :nome
      t.string :logradouro
      t.string :cidade
      t.string :uf
      t.string :cep
      t.string :telefone
      t.string :email
      t.string :politica_publica
      t.string :tipo_atendimento
      t.string :dias_atendimento
      t.string :horario_atendimento
      t.string :clientela
      t.string :area_abrangencia
      t.string :primeiro_atendimento
      t.string :documentacao_atendimento
      t.string :pagamento
      t.string :descricao
      t.string :tipo
      t.string :subtipo
      t.string :slug
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :dispositivos, :slug, unique: true
  end
end
