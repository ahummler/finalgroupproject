class TwilioSmsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def incoming

		from_number = params[:From]
		message_body = params[:Body]
		response = Twilio::TwiML::Response.new do |r|
	  	r.sms 'message received'
		end

		render text: response.text
	end

 	def identify
 		owner = User.find_by(phone: params[:from])
 	end
end
