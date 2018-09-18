class Group < ApplicationRecord
	has_many :students, class_name: 'User'
	has_and_belongs_to_many :teachers, class_name: 'User'
	has_many :workshops
end
