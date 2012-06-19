require 'spec_helper'

describe 'pentagram-web' do
  let(:facts) do
    { :osfamily => 'debian' }
  end

  it 'must include the Puppet apache module' do
    should include_class('apache')
  end

  it 'must include the Puppet ruby module' do
    should include_class('ruby')
  end

  it 'must include the Puppet passenger module' do
    should include_class('passenger')
  end

  it 'should include the build-essential for passenger' do
    should contain_package('build-essential').with(
      {'ensure' => 'present'}
    )
  end

  it 'should include the zlib development headers for passenger' do
    should contain_package('zlib-devel').with(
      {'ensure' => 'present'}
    )
  end
end
