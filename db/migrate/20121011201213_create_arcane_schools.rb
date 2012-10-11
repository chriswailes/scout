class CreateArcaneSchools < ActiveRecord::Migration
  def change
    create_table :arcane_schools do |t|
      t.string :name

      t.timestamps
    end
  end
end
