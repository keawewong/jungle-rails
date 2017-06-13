class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'order_confirm'

  def send_order_confirm(current_user)
    mail(to: current_user.email, subject: 'thanks for ordering',
    template_path: 'order_confirm',
    template_name: 'order_confirm')
  end

end
