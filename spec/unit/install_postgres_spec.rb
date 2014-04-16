require 'unit/spec_helper'

describe 'sprout-postgresql::install_postgres' do
  let(:runner) { ChefSpec::Runner.new }

  before do
    stub_command('which git')
    runner.node.set['sprout']['postgresql']['preserve_dbs'] = false
  end

  it 'installs homebrew if needed' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('homebrew')
  end

  it 'installs the postgres homebrew formula' do
    runner.converge(described_recipe)
    expect(runner).to install_package('postgresql')
  end

  it 'recreates the data directory to ensure databases are UTF8 encoded' do
    runner.converge(described_recipe)
    expect(runner).to delete_directory('/usr/local/var/postgres').with_recursive(true)
    expect(runner).to run_execute(
      'initdb /usr/local/var/postgres'
    ).with_environment('LC_ALL' => nil).with_user('fauxhai')
  end

  it 'does not recreate the data directory if there were dbs before installing postgresql with brew' do
    runner.node.set['sprout']['postgresql']['preserve_dbs'] = true
    runner.converge(described_recipe)
    expect(runner).not_to delete_directory('/usr/local/var/postgres')
    expect(runner).not_to run_execute(/initdb/)
  end
end
