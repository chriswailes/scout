class CreateDeities < ActiveRecord::Migration
  def change
    create_table :deities do |t|
      t.string :name

      t.timestamps
    end
  end
end
