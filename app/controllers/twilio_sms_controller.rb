class TwilioSmsController < ApplicationController

skip_before_action :verify_authenticity_token

def incoming
	#my_sid = ENV['TWILIO_APP_TEST_KEY']
	#my_token = ENV['TWILIO_TEST_TOKEN']
	#client = Twilio::REST::Client.new(account_sid: my_sid, auth_token: my_token)

	from_number = params[:From]
	message_body = params[:Body]
	response = Twilio::TwiML::Response.new do |r|
  	r.sms 'message received'
	end

	#message = client.messages.create from: '415-599-2671', to: '248-962-8305', body: 'Learning to send SMS you are.'

	render text: response.text
end	
 

end
