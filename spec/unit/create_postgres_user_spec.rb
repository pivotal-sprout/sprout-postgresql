require 'unit/spec_helper'

describe 'sprout-postgresql::create_postgres_user' do
  let(:runner) { ChefSpec::SoloRunner.new }
  let(:existing_postgres_user) { false }
  let(:create_command) { '/usr/local/bin/createuser -U fauxhai --superuser postgres' }

  before do
    stub_command('which git')
    stub_command('psql -U postgres -c "select 1" &> /dev/null').and_return(existing_postgres_user)
    runner.converge(described_recipe)
  end

  it 'runs postgres if needed' do
    expect(runner).to include_recipe('sprout-postgresql::add_launch_agent')
  end

  it 'creates the postgres user' do
    expect(runner).to run_execute(create_command).with(user: 'fauxhai')
  end

  context 'when the postgres user aready exists' do
    let(:existing_postgres_user) { true }

    it 'gets skipped' do
      expect(runner).to_not run_execute(create_command).with(user: 'fauxhai')
    end
  end
end
