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
  	file.puts "QGC WPL 110"
  	file.puts "0	1	0	16	0	0	0	0	37.389122	-77.710515	75.730003	1"
  	file.puts "1	0	3	179	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	6.000000	1"
  	file.puts "2	0	3	16	0.000000	0.000000	0.000000	0.000000	#{order.latitude}	#{order.longitude}	6.000000	1"
  	file.puts "3	0	3	21	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	1"
  	file.close
  	file_path
  end

end
