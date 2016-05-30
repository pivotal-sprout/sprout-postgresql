require 'unit/spec_helper'

RSpec.describe 'sprout-postgresql::add_launch_agent' do
  let(:runner) { ChefSpec::SoloRunner.new }

  before do
    stub_command('which git')
    runner.converge(described_recipe)
  end

  it 'installs postgres if needed' do
    expect(runner).to include_recipe('sprout-postgresql::install_postgres')
  end

  it 'launches postgres with brew services' do
    expect(runner).to run_execute(
      'brew services start postgresql'
    ).with(user: 'fauxhai')
  end
end
