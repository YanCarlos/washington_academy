class HomeController < ApplicationController
	def index
		@contacting = Contacting.new
	end
end
