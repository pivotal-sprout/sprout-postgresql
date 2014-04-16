require 'spec_helper'
require 'socket'

describe 'sprout-postgresql' do
  before :all do
    expect(system('soloist')).to be_true
  end

  it 'installs and starts postgres' do
    expect {
      TCPSocket.open('localhost', 5432).close
    }.not_to raise_error

    expect {
      system("sudo -u #{node['current_user']} /usr/local/bin/psql -U postgres < /dev/null")
    }.to be_true
  end
end
