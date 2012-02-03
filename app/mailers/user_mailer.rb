class UserMailer < ActionMailer::Base
  default from: "diego.nudler@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(:to => user.email, :subject => "Acceso a formulario de pedido de Mundo Rec")
  end

end
