class CreateProductionKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :production_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
