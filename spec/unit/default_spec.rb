require 'unit/spec_helper'

RSpec.describe 'sprout-postgresql::default' do
  let(:runner) { ChefSpec::SoloRunner.new }

  before do
    stub_command('which git')
    stub_command(/psql/)
  end

  it 'includes the path recipe' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-postgresql::install_postgres')
    expect(runner).to include_recipe('sprout-postgresql::add_launch_agent')
    expect(runner).to include_recipe('sprout-postgresql::create_current_user_db')
    expect(runner).to include_recipe('sprout-postgresql::create_postgres_user')
  end
end
