class SpellLevel < ActiveRecord::Base
  belongs_to :spell
  belongs_to :character_class
  
  attr_accessible :level
  
  validates :level, presence: true
end
