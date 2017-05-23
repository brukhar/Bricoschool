class ExampleMailer < ApplicationMailer
  default from: "objecris@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
