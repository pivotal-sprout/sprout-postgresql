require 'unit/spec_helper'

describe 'sprout-postgresql::install_postgres' do
  let(:runner) { ChefSpec::Runner.new }

  before do
    stub_command('which git')
  end

  it 'installs the postgres homebrew formula' do
    runner.converge(described_recipe)
    expect(runner).to install_package('postgresql')
  end
end
