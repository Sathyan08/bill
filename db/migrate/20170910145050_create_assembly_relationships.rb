class CreateAssemblyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :assembly_relationships do |t|
      t.references :assembly, index: true, foreign_key: true
      t.references :sub_assembly, index: true

      t.timestamps
    end

    add_foreign_key :assembly_relationships, :assemblies, column: :sub_assembly_id
  end
end
