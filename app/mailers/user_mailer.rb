class UserMailer < ApplicationMailer
    default from: 'no-reply@evenbrides.fr'

    def welcome_email(user)
        @user = user      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @url  = 'evenbrides/login'       #on définit une variable @url qu'on utilisera dans la view d’e-mail     
        mail(to: @user.email, subject: 'Bienvenue chez nous !')       # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.    
    end

    def event_participation_email(user, event)
      @user = user
      @event = event
      @url = 'evenbrides.fr'
      mail(to:@user.email, subject:"Participation à l'évènement #{@event.title}")
	  end
end