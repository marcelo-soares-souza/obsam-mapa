class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
    add_index :images, :slug, unique: true
  end
end
