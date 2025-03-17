require_relative 'robot'
class Menu
  def self.show_menu
    menu_info = """
      Robot coming online.
      Available commands:
      M - Move robot forward
      L - Turn robot left
      R - Turn robot right
      ? - Show available commands
      Q - Exit the robot console"""

    puts(menu_info)
  end

  def self.menu_loop
    robot = Robot.new
    show_menu
    loop do
      menu_option = capture_menu_option
      case menu_option
      when "L"
        robot.move_left
        print_position(robot)
      when "R"
        robot.move_right
        print_position(robot)
      when "M"
        robot.move_forward
        print_position(robot)
      when "?"
        show_menu
      when "Q"
        quit_command()
        return()
      end
    end
  end

  def self.capture_menu_option
    cli_input = gets.chomp()
    cli_input.split("").first
  end

  def self.quit_command
    puts "Robot going offline"
  end

  def self.print_position(robot)
    puts "Robot at position [#{robot.x},#{robot.y}] facing #{robot.facing}"
  end
end


Menu.menu_loop