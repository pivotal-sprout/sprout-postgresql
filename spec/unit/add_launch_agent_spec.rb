require 'unit/spec_helper'

describe 'sprout-postgresql::add_launch_agent' do
  let(:runner) { ChefSpec::Runner.new }
  let(:plist_filename) { runner.node['sprout']['postgresql']['plist_filename'] }
  let(:launchagent_path) { '/home/fauxhai/Library/LaunchAgents' }

  before do
    stub_command('which git')
  end

  it 'ensures the launchAgents directory exists' do
    runner.converge(described_recipe)
    expect(runner).to create_directory(launchagent_path).with(recursive: true).with(user: 'fauxhai')
  end

  it 'symlinks the homebrew launch configuration into the launchAgents folder' do
    runner.converge(described_recipe)

    expect(runner).to create_link(
      "#{launchagent_path}/#{plist_filename}"
    ).with(to: "/usr/local/opt/postgresql/#{plist_filename}").with(link_type: Symbol)
  end

  it 'launches postgres' do
    runner.converge(described_recipe)
    expect(runner).to run_execute(
      "launchctl load -w #{launchagent_path}/#{plist_filename}"
    ).with(user: 'fauxhai')
  end
end
