The challenge is to write a command line interface to control a robot on a 2-dimensional plane.

The robot should accept the following commands:

M - Move robot forward

L - Turn robot left

R - Turn robot right

? - Show available commands

Q - Exit the robot console

After each command, the program should print out the robot’s current status to the console, for example: `Robot at position [1,3] facing West`
$ ruby robot_cli.rb

Robot coming online.
Available commands:
  M - Move robot forward
  L - Turn robot left
  R - Turn robot right
  ? - Show available commands
  Q - Exit the robot console

> M
Robot at position [0,1] facing North
> M
Robot at position [0,2] facing North
> R
Robot at position [0,2] facing East
> M
Robot at position [1,2] facing East
> M
Robot at position [2,2] facing East
> R
Robot at position [2,2] facing South
> M
Robot at position [2,1] facing South
> M
Robot at position [2,0] facing South
> M
Robot at position [2,-1] facing South
> R
Robot at position [2,-1] facing West
> M
Robot at position [1,-1] facing West
> M
Robot at position [0,-1] facing West
> M
Robot at position [-1,-1] facing West
> L
Robot at position [-1,-1] facing South
> ?
Available commands:
  M - Move robot forward
  L - Turn robot left
  R - Turn robot right
  ? - Show available commands
  Q - Exit the robot console

> Q
Robot going offline