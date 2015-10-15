class CardMailer < ActionMailer::Base

	def business_card(message_body)
		mail(to: message_body,
				from: "workingtitle@workingtitle.com", 
				subject: "You Received a Business Card",
		)
	end

	def confirm_sent(user)
		mail(to: user.email,
				from: "workingtitle@workingtitle.com", 
				subject: "You Received a Business Card",
		)

end
