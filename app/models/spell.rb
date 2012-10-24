class Spell < ActiveRecord::Base
	belongs_to :arcane_school
	belongs_to :deity
	belongs_to :source
	
	alias :school :arcane_school
	
	has_many :domains
	has_many :subschools
	
	has_many :spell_levels
	has_many :character_classes, through: :spell_levels
	
	alias :levels :spell_levels
	
	has_and_belongs_to_many :spell_attributes, join_table: 'spells_spell_attributes'
	
	attr_accessible :area,
				 :casting_time,
				 :description,
				 :dismissible,
				 :divine_focus,
				 :duration,
				 :effect,
				 :focus,
				 :formatted_description,
				 :material,
				 :name,
				 :range,
				 :saving_throw,
				 :shapeable,
				 :short_description,
				 :somatic,
				 :spell_resistance,
				 :targets,
				 :verbal
	
	validates :arcane_school, presence: true
	validates :name, presence: true
	validates :source, presence: true
end
