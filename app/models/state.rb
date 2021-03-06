class State < ActiveRecord::Base

	validates :name, :color,  presence: true
	
	def to_s
	  name
	end

	def make_default!
		State.update_all(default: false)
		update!(default: true)
	end

	def self.default
		find_by(default: true)
	end
end
