class RsvpMailer < ActionMailer::Base
  default :from => "ashleyandsergio@gmail.com"

  email1 = "sergio.umana@gmail.com"
  email2 = "ashley.nolting@gmail.com"



  def rsvp_confirmation(household)
    @household = household

    mail(:to => "sergio.umana@gmail.com", :cc => "ashley.nolting@gmail.com", :subject => "RSVP Confirmation")
  end
end
