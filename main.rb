require_relative 'robot_controller'

def main
  robot_controller = RobotController.new

  puts "Toy Robot Simulation"
  puts "Commands:"
  puts "- PLACE X,Y,F"
  puts "- MOVE"
  puts "- LEFT"
  puts "- RIGHT"
  puts "- REPORT"
  puts "Type 'EXIT' to quit."

  loop do
    print "Enter command: "
    command = gets.chomp.upcase

    if command == "EXIT"
      puts "Exiting Toy Robot Simulation."
      break
    end

    robot_controller.execute_command(command)
  end
end

if __FILE__ == $0
  main
end
