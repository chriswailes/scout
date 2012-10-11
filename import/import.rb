#!/usr/bin/ruby

require 'csv'

require 'rubygems'
require 'active_support/core_ext'

SPELL_FILE = 'spell_full.csv'

spells = CSV.open(SPELL_FILE)

# Build a struct class for representing individual spells.
Spell = Struct.new(*spells.readline.map { |s| s.to_sym })

schools = Hash.new
domains = Hash.new
deities = Hash.new
sources = Hash.new

# Read in each spell.
spells.each do |row|
	spell = Spell.new(*row)
	
	schools[spell.school.titleize] ||= Hash.new if not spell.school.nil?
	
	spell.subschool.split(', ').each { |s| schools[spell.school.titleize][s.titleize] = true } if not spell.subschool.nil?
	
	deities[spell.deity.titleize] = true if not spell.deity.nil?
	
	spell.domain.split(', ').each { |d| domains[d.titleize] = true if d != 'NULL' }
	
	sources[spell.source.titleize] = true
end

puts 'Spell Schools:'
schools.keys.sort.each do |s|
	puts "\t#{s}"
	
	schools[s].keys.sort.each { |s| puts "\t\t#{s}" }
end
puts

#puts 'Spell Subschools:'
#subschools.keys.sort.each { |s| puts "\t#{s}" }
#puts

puts 'Spell Domains:'
domains.keys.sort.each { |d| puts "\t#{d}" }
puts

puts 'Deities:'
deities.keys.sort.each { |d| puts "\t#{d}" }
puts

puts 'Sources:'
sources.keys.sort.each { |s| puts "\t#{s}" }
