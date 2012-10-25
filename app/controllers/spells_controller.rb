class SpellsController < ApplicationController
	def index
		@keyword = params[:keyword] or ''
		
		@spells =
		if params[:keyword]
			wkeyword = '%' + params[:keyword] + '%'
			Spell.where('name LIKE ? OR description LIKE ?', wkeyword, wkeyword)
			
		else
			Spell.all
		end
	end
	
#	def show
#		@spell = Spell.find(params[:id])
#	end
end
