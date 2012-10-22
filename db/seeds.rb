#!/usr/bin/ruby

############
# Includes #
############

# Standard Library
require 'csv'

#########
# Setup #
#########

SPELL_FILE = './db/spell_full.csv'

spells = CSV.open(SPELL_FILE)

FOCUS_REGEXP		= /F \(([^\)]+)\)/
MATERIAL_REGEXP	= /M \(([^\)]+)\)/

ATTRIBUTES = [
			:acid,
			:air,
			:chaotic,
			:cold,
			:curse,
			:darkness,
			:death,
			:disease,
			:earth,
			:electricity,
			:emotion,
			:evil,
			:fear,
			:fire,
			:force,
			:good,
			:language_dependent,
			:lawful,
			:light,
			:mind_affecting,
			:pain,
			:poison,
			:shadow,
			:sonic,
			:water
		]

CHARACTER_CLASSES = {
					sor: 'Sorcerer',
					wiz: 'Wizard',
					cleric: 'Cleric',
					druid: 'Druid',
					ranger: 'Ranger',
					bard: 'Bard',
					paladin: 'Paladin',
					alchemist: 'Alchemist',
					summoner: 'Summoner',
					witch: 'Witch',
					inquisitor: 'Inquisitor',
					oracle: 'Oracle',
					antipaladin: 'Anti-Paladin',
					magus: 'Magus'
				}

schools			= Hash.new { |h, k| r = ArcaneSchool.new(name: k);	r.save; h[k] = r }
domains			= Hash.new { |h, k| r = Domain.new(name: k);			r.save; h[k] = r }
deities			= Hash.new { |h, k| r = Deity.new(name: k);			r.save; h[k] = r }
sources			= Hash.new { |h, k| r = Source.new(name: k);			r.save; h[k] = r }
subschools		= Hash.new
attributes		= Hash.new
character_classes	= Hash.new

ATTRIBUTES.each do |a|
	r = SpellAttribute.new(name: a.to_s)
	r.save!
	
	attributes[a] = r
end

CHARACTER_CLASSES.each do |sym, name|
	r = CharacterClass.new(name: name)
	r.save!
	
	character_classes[sym] = r
end

###########
# Classes #
###########

SpellRow = Struct.new(*spells.readline.map { |s| s.to_sym })

##############
# Processing #
##############

# Add each row/spell to the database.
spells.each do |row|
	spell_row = SpellRow.new(*row)
	
	#######################
	# Pre-process the row #
	#######################
	
	school = schools[spell_row.school.titleize]
	source = sources[spell_row.source.titleize]
	
	spell_subschools =
	if spell_row.subschool
		spell_row.subschool.split(', ').map do |ss|
			subschool = subschools[ss.titleize]
		
			if not subschool
				subschool					= Subschool.new(name: ss.titleize)
				subschool.arcane_school		= school
			
				subschool.save!
				
				subschools[subschool.name]	= subschool
			end
		
			subschool
		end
	else
		[]
	end
	
	spell_domains =
	spell_row.domain.split(', ').map do |d|
		if d == 'NULL' then nil else domains[d.titleize] end
	end.compact
	
	deity = if spell_row.deity then deities[spell_row.deity.titleize] else nil end
	
	spell_focus	= if md = FOCUS_REGEXP.match(spell_row.components)    then md.captures.first else '' end
	spell_material	= if md = MATERIAL_REGEXP.match(spell_row.components) then md.captures.first else '' end
	
	spell_attrs = ATTRIBUTES.select { |a| spell_row.send(a) == '1' }.map { |a| attributes[a] }
	
	spell_levels = Array.new
	CHARACTER_CLASSES.select { |cc, _| spell_row.send(cc) != 'NULL' }.each do |cc, _|
		spell_levels << (r = SpellLevel.new(level: spell_row.send(cc).to_i))
		
		r.character_class = character_classes[cc]
	end
	
	################
	# Create spell #
	################
	
	spell = Spell.new
	
	spell.name = spell_row.name
	
	spell.arcane_school		= school
	spell.subschools		= spell_subschools
	spell.deity			= deity
	spell.source			= source
	spell.domains			= spell_domains
	spell.spell_attributes	= spell_attrs
	
	spell.area				= spell_row.area
	spell.casting_time			= spell_row.casting_time
	spell.description			= spell_row.description
	spell.dismissible			= spell_row.dismissible == '1'
	spell.divine_focus			= spell_row.divine_focus == '1'
	spell.duration				= spell_row.duration
	spell.effect				= spell_row.effect
	spell.focus				= spell_focus
	spell.formatted_description	= spell_row.description_formatted
	spell.material				= spell_material
	spell.range				= spell_row.range
	spell.saving_throw			= spell_row.saving_throw
	spell.shapeable			= spell_row.shapeable == '1'
	spell.short_description		= spell_row.short_description
	spell.somatic				= spell_row.somatic == '1'
	spell.spell_resistance		= spell_row.spell_resistance != 'no'
	spell.targets				= spell_row.targets
	spell.verbal				= spell_row.verbal == '1'
	
	spell.save!
	
	# Finalize the spell levels
	spell_levels.each { |sl| sl.spell = spell; sl.save! }
end

