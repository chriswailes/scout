class CreateSpellAttributes < ActiveRecord::Migration
  def change
    create_table :spell_attributes do |t|
      t.string :name

      t.timestamps
    end
  end
end
