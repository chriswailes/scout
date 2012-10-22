class CreateSpellLevels < ActiveRecord::Migration
  def change
    create_table :spell_levels do |t|
      t.integer :level
      t.references :spell
      t.references :character_class

      t.timestamps
    end
    add_index :spell_levels, :spell_id
    add_index :spell_levels, :character_class_id
  end
end
