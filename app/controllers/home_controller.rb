class HomeController < ApplicationController
	def index
		@contacting = Contacting.new
	end


	def save_message
		@contacting = Contacting.new(message_params)
		if @contacting.save
			flash[:success] = 'Su mensaje fue enviado correctamente.'
		else
			flash[:error] = 'Error al enviar su mensaje.'
		end
		redirec_to '#contact_us'
	end

	private

	def message_params
		params.permit(
			:name,
			:phone,
			:message
		)
	end
end
