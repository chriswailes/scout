class SpellAttribute < ActiveRecord::Base
	has_and_belongs_to_many :spells, join_table: 'spells_spell_attributes'
	
	attr_accessible :name
	
	validates :name, presence: true, uniqueness: true
end
