class CharacterClass < ActiveRecord::Base
	has_many :spell_levels
	has_many :spells, through: :spell_levels	
	
	attr_accessible :name

	validates :name, presence: true, uniqueness: true
end
