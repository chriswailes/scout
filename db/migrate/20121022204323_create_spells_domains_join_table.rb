class CreateSpellsDomainsJoinTable < ActiveRecord::Migration
  def up
    create_table :spells_domains, :id => false do |t|
      t.references :spell
      t.references :domain
    end
  end

  def down
  	drop_table :spells_domains
  end
end
