# Class: lsuser
# ===========================
#
# Full description of class user here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'lsuser':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
define lsuser (
 $full_name,
 $gid,
 $authorized_keys = '',
 $password = '$6$JTaihXCB$Wf2WOglPS1yuy88ov0AUFKN7f7MAzpClFZALaKgJZ2WLh2ks3qBX7GN6X5oHoMwD1BtjFivbhzLafpl.6mMKt/',
 $password_max_age = '999',
 $rsapubkey = '',
 $rsakey = '',
 $dsapubkey = '',
 $dsakey = '',
 $shell = '/bin/bash',
) {

 $home_root = $kernel ? {
  'SunOS' => '/export/home',
  'Linux' => '/home',
  default => '/home'
 }

 $userid = $title
 user { $userid:
  comment => "$full_name",
  shell => "$shell",
  gid => $gid,
  managehome => true,
  home => "$home_root/$userid",
  password => "$password",
  password_max_age => "$password_max_age"
 }

 file { "$home_root/$userid/.ssh":
   ensure => 'directory',
   mode => '700',
   owner => "$userid",
   group => $gid,
 }

 file { "$home_root/$userid/.ssh/authorized_keys":
   ensure => 'present',
   mode => '600',
   owner => "$userid",
   group => $gid,
   content => "$authorized_keys",
   require => File["$home_root/$userid/.ssh"],
 }

}
