class OrdersMailer < ActionMailer::Base
  default from: "from@example.com"

  def mission_email(order)
  	attachments["mission_file_#{order.id}.txt"] = 
  	  File.read(create_mission_attachment (order))
  	@order = order
  	@product = order.product
  	# [fix] - Add this as an environmental variable in Figaro
    mail(to: ENV["DRONE_OPERATOR_EMAIL"], subject: 'Drone Mission')
  end

  def create_mission_attachment order
  	file_path = File.join "#{Rails.root}", "tmp", "mission_file_#{order.id}.txt"
  	file = File.new(file_path,  "w+") 
  	file.puts "lat:#{order.latitude} long:#{order.longitude}"
  	file.close
  	file_path
  end

end
