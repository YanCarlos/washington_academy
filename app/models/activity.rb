class Activity < ApplicationRecord
	belongs_to :group
	belongs_to :teacher, class_name: 'User'

	rolify
	
	attr_accessor :type

	validate :empty_fields?

	def empty_fields?
		errors.add(:deadline, 'Please enter a value') if self.deadline.nil?
		errors.add(:content, 'Please enter a value') if self.content.empty?
	end

	def be_workshop
		add_role :workshop
	end

	def be_discussion
		add_role :discussion
	end

	def status
		if self.deadline > DateTime.now
			'Open'
		else
			'Closed'
		end
	end


	def self.free_percentage group, teacher
		100 - Activity.where('group_id = ? and user_id = ?', group.id, teacher.id).sum(:percentage).to_i
	end
end
