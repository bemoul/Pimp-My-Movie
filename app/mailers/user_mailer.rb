class UserMailer < ApplicationMailer

	def welcome_email(user)

		@user = user
		@url = '<https://pimpmymovie.herokuapp.com>'


		mail(to: @user.email, subject: 'Bienvenue sur Pimp My Movie !')
	end
end
