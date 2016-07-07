require 'puppetlabs_spec_helper/module_spec_helper'

describe 'lsuser', :type => 'define' do
 it { is_expected.to contains_class('user') } 
end
