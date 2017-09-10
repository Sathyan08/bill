class CreateAssemblyParts < ActiveRecord::Migration[5.1]
  def change
    create_table :assembly_parts do |t|
      t.references :assembly, index: true, foreign_key: true, null: false
      t.references :part, index: true, foreign_key: true, null: false
      t.integer :part_quantity, default: 1, null: false

      t.timestamps
    end

    add_index :assembly_parts, [:assembly_id, :part_id], unique: true
  end
end
