class MandrillController < ApplicationController

def deliver
	YourMailer.email_name.deliver
end


