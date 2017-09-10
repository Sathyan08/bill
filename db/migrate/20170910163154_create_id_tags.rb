class CreateIdTags < ActiveRecord::Migration[5.1]
  def change
    create_table :id_tags do |t|
      t.string :identifier, null: false
      t.belongs_to :id_taggable, polymorphic: true

      t.timestamps
    end

    add_index :id_tags, :identifier, unique: true
    add_index :id_tags, [:id_taggable_id, :id_taggable_type]
  end
end
