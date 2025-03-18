class Robot
  attr_reader :x, :y, :facing
  DIRECTIONS = [:north, :east, :south, :west]
  RIGHT = 1
  LEFT = -1

  def initialize
    @x = 0
    @y = 0
    @facing = :north
  end

  def move_forward
    case @facing
    when :north
      @y += 1
    when :east
      @x += 1
    when :south
      @y -= 1
    when :west
      @x -= 1
    end
  end

  def move_left
    calculate_rotation(LEFT)
  end

  def move_right
    calculate_rotation(RIGHT)
  end

  private

  def calculate_rotation(direction)
    origin_index = DIRECTIONS.index(@facing)

    origin_index = (origin_index + direction) % DIRECTIONS.size()
    @facing = DIRECTIONS[origin_index]
  end
end