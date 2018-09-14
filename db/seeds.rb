# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def create_admin
	user = User.create_with({
		name: Faker::Name.name_with_middle,
		phone: Faker::PhoneNumber.phone_number,
		address: Faker::Address.street_address,
		identification: Faker::Number.number(3),
		password: '1234567890'
	}).find_or_create_by(email: 'admin@wa.com')
	user.be_admin
end


def create_student
	user = User.create_with({
		name: Faker::Name.name_with_middle,
		phone: Faker::PhoneNumber.phone_number,
		address: Faker::Address.street_address,
		identification: Faker::Number.number(3),
		password: '1234567890'
	}).find_or_create_by(email: 'student@wa.com')
	user.be_student
end



def create_teacher
	user = User.create_with({
		name: Faker::Name.name_with_middle,
		phone: Faker::PhoneNumber.phone_number,
		address: Faker::Address.street_address,
		identification: Faker::Number.number(3),
		password: '1234567890'
	}).find_or_create_by(email: 'teacher@wa.com')
	user.be_teacher
end

create_admin
create_student
create_teacher
