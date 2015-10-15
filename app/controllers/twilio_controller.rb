class TwilioController < ApplicationController
	skip_before_action :verify_authenticity_token

	def incoming
		from_number = params["From"]
		message_body = params["Body"]
		user = User.find_by(phone: from_number) 
		response = Twilio::TwiML::Response.new do |r|
			if user != nil 
				r.sms "Your card is on its way to #{message_body}"
			else
				r.sms 'There was a problem sending your business card.'
			end
		end
		render text: response.text
	end

	# def send
		
	# end		

end


# From twilio : 

# User sends text to twilio ph #
# params[:From] will be used to lookup the user via phone number in our database.
# Next, the associated business card with that user will be found
# Then, mandrill will compile an email and address it to the recipient using params[:Body] from twilio. 
# it will also include a link to the user’s business card 
# Recipient will click on link and be directed to the user’s business card view w/o editing capabilities
# Option to send contact info back to user, w/ option to sign up to service

# Mandril model - set up search f(x) to look up user 

# typeof for from_number and message_body

# outbound_controller
# 	twilio + mandrill 


# user phone number will need to be sanitized by backend to only have 10 integers and concatinate the +