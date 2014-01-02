class OrdersMailer < ActionMailer::Base
  default from: "from@example.com"

  def mission_email(order)
  	@order = order
  	@product = order.product
  	# [fix] - Add this as an environmental variable in Figaro
    mail(to: "peter.braswell@gmail.com", subject: 'Drone Mission')
  end

end
