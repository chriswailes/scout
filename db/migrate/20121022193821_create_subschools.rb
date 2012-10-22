class CreateSubschools < ActiveRecord::Migration
  def change
    create_table :subschools do |t|
      t.string :name
      t.references :arcane_school

      t.timestamps
    end
    add_index :subschools, :arcane_school_id
  end
end
