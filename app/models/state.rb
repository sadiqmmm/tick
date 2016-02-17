class State < ActiveRecord::Base

	validates :name, :color,  presence: true
	
	def to_s
	  name
	end
end
