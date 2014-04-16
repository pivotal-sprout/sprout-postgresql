require 'unit/spec_helper'

describe 'sprout-postgresql::install_postgres' do
  let(:runner) { ChefSpec::Runner.new }
  let(:postgres_data_dir) { '/usr/local/var/postgres' }
  let(:preserve_dbs) { false }

  before do
    stub_command('which git')
    runner.node.set['sprout']['postgresql']['preserve_dbs'] = preserve_dbs
    runner.converge(described_recipe)
  end

  it 'installs homebrew if needed' do
    expect(runner).to include_recipe('homebrew')
  end

  it 'installs the postgres homebrew formula' do
    expect(runner).to install_package('postgresql')
  end

  it 'recreates the data directory to ensure databases are UTF8 encoded' do
    expect(runner).to delete_directory(postgres_data_dir).with_recursive(true)
    expect(runner).to run_execute(
      "initdb #{postgres_data_dir}"
    ).with_environment('LC_ALL' => nil).with_user('fauxhai')
  end

  context 'when there were dbs before installing postgresql with brew' do
    let(:preserve_dbs) { true }

    it 'does not recreate the data directory' do
      expect(runner).not_to delete_directory(postgres_data_dir)
      expect(runner).not_to run_execute(/initdb/)
    end
  end
end
