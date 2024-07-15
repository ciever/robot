require_relative '../robot'

RSpec.describe Robot do
  let(:robot) { Robot.new }

  describe '#place' do
    context 'when placing the robot' do
      it 'places the robot at the specified position and direction' do
        robot.place(0, 0, 'NORTH')
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
        expect(robot.facing).to eq('NORTH')
      end

      it 'ignores placement outside the tabletop boundaries' do
        robot.place(5, 5, 'NORTH')
        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.facing).to be_nil
      end

      it 'ignores placement with an invalid direction' do
        robot.place(0, 0, 'INVALID')
        expect(robot.x).to be_nil
        expect(robot.y).to be_nil
        expect(robot.facing).to be_nil
      end

      it 'ignores subsequent invalid placements after valid placement' do
        robot.place(1, 1, 'EAST')
        robot.place(6, 6, 'SOUTH') # Invalid placement
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(1)
        expect(robot.facing).to eq('EAST')
      end
    end
  end

  describe '#move' do
    before do
      robot.place(0, 0, 'NORTH')
    end

    context 'when moving within the tabletop boundaries' do
      it 'moves the robot one unit in the specified direction along the y-axis' do
        robot.move
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(1)
      end

      it 'moves the robot one unit in the specified direction along the x-axis' do
        robot.place(0, 0, 'EAST')
        robot.move
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(0)
      end
    end

    context 'when attempting to move outside the tabletop boundaries' do
      it 'does not move the robot beyond the tabletop limits when initially placed at (0, 4)' do
        robot.place(0, 4, 'NORTH')
        robot.move
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(4)
      end

      it 'keeps the robot at its previous position when placed at an invalid position (6, 6)' do
        robot.move
        robot.place(6, 6, 'NORTH')
        robot.move
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(2)
      end
    end
  end

  describe '#left' do
    context 'when turning left' do
      context 'from NORTH' do
        before { robot.place(0, 0, 'NORTH') }

        it 'turns the robot 90 degrees to the left (WEST)' do
          robot.left
          expect(robot.facing).to eq('WEST')
        end
      end

      context 'from EAST' do
        before { robot.place(0, 0, 'EAST') }

        it 'turns the robot 90 degrees to the left (NORTH)' do
          robot.left
          expect(robot.facing).to eq('NORTH')
        end
      end

      context 'from SOUTH' do
        before { robot.place(0, 0, 'SOUTH') }

        it 'turns the robot 90 degrees to the left (EAST)' do
          robot.left
          expect(robot.facing).to eq('EAST')
        end
      end

      context 'from WEST' do
        before { robot.place(0, 0, 'WEST') }

        it 'turns the robot 90 degrees to the left (SOUTH)' do
          robot.left
          expect(robot.facing).to eq('SOUTH')
        end
      end
    end
  end

  describe '#right' do
    context 'when turning right' do
      context 'from NORTH' do
        before { robot.place(0, 0, 'NORTH') }

        it 'turns the robot 90 degrees to the right (EAST)' do
          robot.right
          expect(robot.facing).to eq('EAST')
        end
      end

      context 'from EAST' do
        before { robot.place(0, 0, 'EAST') }

        it 'turns the robot 90 degrees to the right (SOUTH)' do
          robot.right
          expect(robot.facing).to eq('SOUTH')
        end
      end

      context 'from SOUTH' do
        before { robot.place(0, 0, 'SOUTH') }

        it 'turns the robot 90 degrees to the right (WEST)' do
          robot.right
          expect(robot.facing).to eq('WEST')
        end
      end

      context 'from WEST' do
        before { robot.place(0, 0, 'WEST') }

        it 'turns the robot 90 degrees to the right (NORTH)' do
          robot.right
          expect(robot.facing).to eq('NORTH')
        end
      end
    end
  end

  describe '#report' do
    context 'when the robot is placed on the tabletop' do
      it 'reports the current position and direction of the robot' do
        robot.place(2, 3, 'SOUTH')
        expect(robot.report).to eq('2,3,SOUTH')
      end
    end

    context 'when the robot is not placed on the tabletop' do
      it 'reports that the robot is not placed' do
        expect(robot.report).to eq('Robot is not placed on the table.')
      end
    end
  end
end
