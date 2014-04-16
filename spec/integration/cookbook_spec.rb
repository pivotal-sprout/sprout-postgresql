require 'spec_helper'

describe 'sprout-postgresql' do
  it 'converges' do
    expect(system('soloist')).to be_true
  end
end
