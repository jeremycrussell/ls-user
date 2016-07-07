require 'spec_helper'
describe 'user' do
  context 'with default values for all parameters' do
    it { should contain_class('user') }
  end
end
