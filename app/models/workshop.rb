class Workshop < ApplicationRecord
	belongs_to :group
	belongs_to :teacher, class_name: 'User'

	rolify

	def be_workshop
		add_role :workshop
	end

	def be_discussion
		add_role :discussion
	end
end
