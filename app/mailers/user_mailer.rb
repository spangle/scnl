class UserMailer < ActionMailer::Base
  default :from => "david.spangle@gmail.com"

	def welcome_email()
		mail(	:to => "david.spangle@gmail.com",
					:subject => "Welcome to the machine")
	end
end
