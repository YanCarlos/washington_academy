module ApplicationHelper

	def is_menu_active? controller
		return 'active' if controller_name.to_sym == controller
	end

	def render_avatar user
		if user.avatar_url(:small).present?
			image_tag(user.avatar_url(:small), class: 'user-avatar avatar-mini')
		else
			image_tag('avatar-standar.png', class: 'user-avatar avatar-mini' )
		end
	end

	def avatar_exists? avatar
		return 'fileinput-exists' if avatar.present?
		return 'fileinput-new'
	end
end
