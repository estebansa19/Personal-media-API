class CreateProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :productions do |t|
      t.string :title
      t.text :description
      t.integer :rate
      t.string :image
      t.references :production_kind, foreign_key: true

      t.timestamps
    end
  end
end
