require 'spec_helper'

describe 'pentagram-web' do
  it 'must include the Puppet apache module' do
    should include_class('apache')
  end
end
