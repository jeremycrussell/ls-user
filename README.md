# user

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with user](#setup)
    * [What luser affects](#what-user-affects)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description
lsuser providers a new resource type of `lsuser`, it builds upon the resource type os user to provide some LegalShield specific attributes.

## Setup

### What user affects **OPTIONAL**

lsuser affects users on any system.

## Usage

  ```lsuser { 'user':
     full_name => 'User Name"
     gid => groupid,
     authorized_keys => 'ssh-rsa <key content>',
   }```

## Reference

## Limitations

Tested on RHEL 6, CentOS 6 & 7

## Development


## Release Notes/Contributors/Etc. **Optional**

2016-09-02 - Adding support to pull `authorized_keys` from an http/s source.
