require 'spec_helper'
require 'socket'

describe 'sprout-postgresql' do
  before :all do
    system('psql -c "select 1" &> /dev/null') && raise('This system already has postgres installed')
    expect(system('soloist')).to be_true
  end

  it 'runs postgres on the default port' do
    expect do
      TCPSocket.open('localhost', 5432).close
    end.not_to raise_error

    expect(system('psql -c "select 1" &> /dev/null')).to be_true
  end

  it 'creates the databases with a UTF-8 encoding' do
    expect(`/usr/local/bin/psql -t -c 'SHOW SERVER_ENCODING'`.strip).to eq('UTF8')
  end

  it 'is managed by launchd' do
    expect(system('launchctl list homebrew.mxcl.postgresql &> /dev/null')).to be_true
  end

  it 'creates a database for the current user' do
    db_name = ENV['USER']
    expect(system("psql -U #{db_name} -c 'select 1' #{db_name} &> /dev/null")).to be_true
  end

  it 'creates a postgres user' do
    expect(system('psql -U postgres -c "select 1" &> /dev/null')).to be_true
  end
end
