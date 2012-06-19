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

  context 'for Apache Passenger' do
    it 'must include the Puppet passenger module' do
      should include_class('passenger')
    end

    it 'should include the build-essential for passenger' do
      should contain_package('build-essential').with(
        {'ensure' => 'present'}
      )
    end

    it 'should include the zlib development headers for passenger' do
      should contain_package('libz-dev').with(
        {'ensure' => 'present'}
      )
    end
  end

  context 'firewall rules' do
    it 'should open port 22' do
      pending 'Waiting until we get to the firewall feature'
      should contain_firewall('sshd').with(
        {'proto'  => 'ssh',
         'action' => 'accept'}
      )
    end
  end
end
