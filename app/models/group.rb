class Group < ApplicationRecord
	has_many :students, class_name: 'User'
	has_and_belongs_to_many :teachers, class_name: 'User'
	has_many :activities

	validate :name_exists?

	def name_exists?
		if Group.find_by(name: self.name)
			errors.add(:name, "This name is taken. Please try another.")
		end
	end
end
