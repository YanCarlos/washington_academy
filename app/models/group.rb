class Group < ApplicationRecord
	has_many :students, class_name: 'User',foreign_key: 'student_id'
end
