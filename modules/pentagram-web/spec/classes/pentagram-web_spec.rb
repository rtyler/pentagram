require 'spec_helper'

describe 'pentagram-web' do
  it 'must include the Puppet apache module' do
    should include_class('apache')
  end

  it 'must include the Puppet ruby module' do
    should include_class('ruby')
  end
end
