class CustomerMailer < ActionMailer::Base
  default from: "info@reridebikes.com"

  def quote_confirmation(customer)
    @customer = customer
    mail to: customer.email, subject: "Quote Confirmation"
  end
end

