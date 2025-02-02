# Toy Robot Simulation

This project simulates a toy robot moving on a square tabletop of dimensions 5 units x 5 units. The robot responds to commands to place itself on the tabletop, move, turn left/right, and report its current position and facing direction.

<img width="830" alt="Screen Shot 2024-07-15 at 3 25 51 pm" src="https://github.com/user-attachments/assets/8f49873b-7d39-4d84-baa1-61fdbd9827b4">

## Setup

### Prerequisites

- Ruby (minimum version 2.6.x)

### Installation

1. **Clone the repository:**

   Clone the GitHub repository to your local machine. Then, navigate to the project directory using your terminal or command line.

2. **Install Bundler:**

   ```
   gem install bundler
   ```
   or update if required using 
   ```
   bundle update --bundler
   ```

3. **Install dependencies:**

   ```
   bundle install
   ```

## Usage

1. **Run the simulation:**

   To run the simulation run the following command:

   ```
   ruby main.rb
   ```

2. **Commands:**

   The simulation accepts the following commands:

   1. **PLACE** - Places the robot on the table at position (X,Y) and facing a cardinal direction (NORTH, SOUTH, EAST, or WEST).
      
      Syntax: PLACE X,Y,Facing
      
      Example: PLACE 0,0,NORTH

      > :warning: Ensure there are no spaces after commas when using the PLACE command. For example, PLACE 0,0, NORTH will not work, but PLACE 0,0,NORTH will work correctly.
        
   3. **MOVE** - Moves the robot one unit forward in the direction it is currently facing.
   4. **LEFT** - Rotates the robot 90 degrees to the left.
   5. **RIGHT** - Rotates the robot 90 degrees to the right.
   6. **REPORT** - Outputs the current position and facing direction of the robot.

3. **Example Usage:**

   After you've executed the simulation, here's a list of command samples to run:

   ```
   PLACE 0,0,NORTH
   ```
   
   ```
   MOVE
   ```

   ```
   REPORT
   ```

   Which should output: **0,1,NORTH**

## Running Tests

   This command will execute the full spec suite using RSpec:

   ```
   bundle exec rspec
   ```
