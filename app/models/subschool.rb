class Subschool < ActiveRecord::Base
	belongs_to :arcane_school
	attr_accessible :name

	validates :name, presence: true, uniqueness: true
end
