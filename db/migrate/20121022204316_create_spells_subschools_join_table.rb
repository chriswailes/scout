class CreateSpellsSubschoolsJoinTable < ActiveRecord::Migration
  def up
    create_table :spells_subschools, :id => false do |t|
      t.references :spell
      t.references :subschool
    end
  end

  def down
    drop_table :spells_subschools
  end
end
