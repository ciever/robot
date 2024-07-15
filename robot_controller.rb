require_relative 'robot'

class RobotController
  def initialize
    @robot = Robot.new
  end

  def execute_command(command)
    args = command.split
    case args[0]
    when "PLACE"
      place_robot(args[1])
    when "MOVE"
      move_robot
    when "LEFT"
      turn_left
    when "RIGHT"
      turn_right
    when "REPORT"
      report_robot
    end
  end

  def place_robot(args)
    x, y, facing = args.split(",")
    @robot.place(x.to_i, y.to_i, facing)
  end

  def move_robot
    @robot.move
  end

  def turn_left
    @robot.left
  end

  def turn_right
    @robot.right
  end

  def report_robot
    puts @robot.report
  end
end
