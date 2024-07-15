class Robot
  attr_accessor :x, :y, :facing

  def initialize
    @x = nil
    @y = nil
    @facing = nil
    @tabletop_size = 5
    @valid_directions = ["NORTH", "EAST", "SOUTH", "WEST"]
  end

  def place(x, y, facing)
    if valid_position?(x, y) && valid_direction?(facing)
      @x = x
      @y = y
      @facing = facing
    end
  end

  def move
    return unless placed?

    case @facing
    when "NORTH"
      @y += 1 if valid_position?(@x, @y + 1)
    when "EAST"
      @x += 1 if valid_position?(@x + 1, @y)
    when "SOUTH"
      @y -= 1 if valid_position?(@x, @y - 1)
    when "WEST"
      @x -= 1 if valid_position?(@x - 1, @y)
    end
  end

  def left
    return unless placed?

    @facing = case @facing
              when "NORTH" then "WEST"
              when "EAST" then "NORTH"
              when "SOUTH" then "EAST"
              when "WEST" then "SOUTH"
              end
  end

  def right
    return unless placed?

    @facing = case @facing
              when "NORTH" then "EAST"
              when "EAST" then "SOUTH"
              when "SOUTH" then "WEST"
              when "WEST" then "NORTH"
              end
  end

  def report
    return "Robot is not placed on the table." unless placed?

    "#{@x},#{@y},#{@facing}"
  end

  private

  def valid_position?(x, y)
    x.between?(0, @tabletop_size - 1) && y.between?(0, @tabletop_size - 1)
  end

  def valid_direction?(facing)
    @valid_directions.include?(facing)
  end

  def placed?
    !@x.nil? && !@y.nil? && !@facing.nil?
  end
end
