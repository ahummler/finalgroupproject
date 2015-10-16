class CardMailer < ActionMailer::Base

	def business_card(recipient_email, personalcard)
		@personalcard = personalcard 
		mail(to: recipient_email,
				from: "workingtitle@workingtitle.com", 
				subject: "You Received a Business Card",
		)
	end

end
