module ApplicationHelper

	def is_menu_active? controller
		return 'active' if controller_name.to_sym == controller
	end
end
