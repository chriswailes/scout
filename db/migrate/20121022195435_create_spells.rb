class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :name
      t.references :arcane_school
      t.string :casting_time
      t.boolean :verbal
      t.boolean :somatic
      t.string :material
      t.string :focus
      t.string :range
      t.string :area
      t.string :effect
      t.string :targets
      t.string :duration
      t.boolean :dismissible
      t.boolean :shapeable
      t.string :saving_throw
      t.boolean :spell_resistance
      t.text :description
      t.text :formatted_description
      t.references :source
      t.boolean :divine_focus
      t.text :short_description
      t.references :deity

      t.timestamps
    end
    
    add_index :spells, :arcane_school_id
    add_index :spells, :source_id
    add_index :spells, :deity_id
  end
end
