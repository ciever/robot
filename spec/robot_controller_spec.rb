require_relative '../robot_controller'

RSpec.describe RobotController do
  let(:controller) { RobotController.new }
  let(:robot) { instance_double(Robot) }

  before do
    allow(Robot).to receive(:new).and_return(robot)
  end

  describe '#initialize' do
    it 'initializes with a new instance of Robot' do
      expect(controller.instance_variable_get(:@robot)).to eq(robot)
    end
  end

  describe '#execute_command' do
    context 'with valid commands' do
      it 'executes PLACE command correctly' do
        expect(robot).to receive(:place).with(0, 0, 'NORTH')
        controller.execute_command('PLACE 0,0,NORTH')
      end

      it 'executes MOVE command correctly' do
        expect(robot).to receive(:move)
        controller.execute_command('MOVE')
      end

      it 'executes LEFT command correctly' do
        expect(robot).to receive(:left)
        controller.execute_command('LEFT')
      end

      it 'executes RIGHT command correctly' do
        expect(robot).to receive(:right)
        controller.execute_command('RIGHT')
      end

      it 'executes REPORT command correctly' do
        expect(robot).to receive(:report)
        expect { controller.execute_command('REPORT') }.to output.to_stdout
      end
    end

    context 'with invalid commands' do
      it 'ignores invalid commands' do
        expect(robot).not_to receive(:place)
        expect(robot).not_to receive(:move)
        expect(robot).not_to receive(:left)
        expect(robot).not_to receive(:right)
        expect(robot).not_to receive(:report)
        controller.execute_command('INVALID_COMMAND')
      end
    end
  end

  describe '#place_robot' do
    it 'calls Robot#place with correct arguments' do
      expect(robot).to receive(:place).with(2, 3, 'EAST')
      controller.place_robot('2,3,EAST')
    end
  end

  describe '#move_robot' do
    it 'calls Robot#move' do
      expect(robot).to receive(:move)
      controller.move_robot
    end
  end

  describe '#turn_left' do
    it 'calls Robot#left' do
      expect(robot).to receive(:left)
      controller.turn_left
    end
  end

  describe '#turn_right' do
    it 'calls Robot#right' do
      expect(robot).to receive(:right)
      controller.turn_right
    end
  end

  describe '#report_robot' do
    it 'calls Robot#report and outputs the result' do
      expect(robot).to receive(:report).and_return('2,3,EAST')
      expect { controller.report_robot }.to output("2,3,EAST\n").to_stdout
    end
  end
end
