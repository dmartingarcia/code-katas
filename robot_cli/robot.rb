class Robot
  attr_reader :x, :y, :facing

  def initialize
    @x = 0
    @y = 0
    @facing = :north
  end

  def move_forward
    x, y = calculate_new_position(@x, @y, @facing)
    @x = x
    @y = y
  end

  def move_left
    @facing = calculate_facing_orientation(@facing, :left)
  end

  def move_right
    @facing = calculate_facing_orientation(@facing, :right)
  end

  private

  def calculate_facing_orientation(origin, turn_direction)
    directions = [:north, :east, :south, :west]
    origin_index = directions.index(origin)
    case turn_direction
    when :left
      origin_index = (origin_index - 1) % directions.size()
      origin_index = directions.size - 1 if origin_index < 0
    when :right
      origin_index = (origin_index + 1) % directions.size()
    else
      raise StandardError, "invalid value #{turn_direction}"
    end
    directions[origin_index]
  end

  def calculate_new_position(x, y, facing)
    case facing
    when :north
      y += 1
    when :east
      x += 1
    when :south
      y -= 1
    when :west
      x -= 1
    end

    return [x, y]
  end
end