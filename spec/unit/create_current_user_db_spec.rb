require 'unit/spec_helper'

describe 'sprout-postgresql::create_current_user_db' do
  let(:runner) { ChefSpec::SoloRunner.new }
  let(:existing_db) { false }
  let(:create_command) { '/usr/local/bin/createdb -U fauxhai' }

  before do
    stub_command('which git')
    stub_command("psql -U fauxhai -c 'select 1' fauxhai &> /dev/null").and_return(existing_db)
    runner.converge(described_recipe)
  end

  it 'starts postgres if needed' do
    expect(runner).to include_recipe('sprout-postgresql::add_launch_agent')
  end

  it 'creates the users database' do
    expect(runner).to run_execute('/usr/local/bin/createdb -U fauxhai').with(user: 'fauxhai')
  end

  context 'when the users database aready exists' do
    let(:existing_db) { true }

    it 'gets skipped' do
      expect(runner).to_not run_execute('/usr/local/bin/createdb -U fauxhai').with(user: 'fauxhai')
    end
  end
end
