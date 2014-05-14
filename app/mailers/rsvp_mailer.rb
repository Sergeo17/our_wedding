class RsvpMailer < ActionMailer::Base
  default :from => "ashleyandsergio@gmail.com"v

  def rsvp_confirmation(household)
    @household = household

    mail(:to => "sergio.umana@gmail.com", :subject => "RSVP Confirmation")
  end
end
