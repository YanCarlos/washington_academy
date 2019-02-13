class ContactingController < ApplicationController
	def index
		@messages = Contacting.all.order(id: :desc)
	end

	def create
		@contacting = Contacting.new(message_params)
		if @contacting.save
			flash[:success] = 'Su mensaje fue enviado correctamente.'
		else
			flash[:error] = 'Error al enviar su mensaje.'
		end
		redirect_to '#contact_us'
	end

	private
	def message_params
		params.require(:contacting).permit(
			:name,
			:phone,
			:message
		)
	end

end
