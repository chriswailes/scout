class CreateSpellsSpellAttributesJoinTable < ActiveRecord::Migration
  def up
    create_table :spells_spell_attributes, :id => false do |t|
      t.references :spell
      t.references :spell_attribute
    end
  end

  def down
    drop_table :spells_spell_attributes
  end
end
