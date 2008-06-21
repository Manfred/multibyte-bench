# encoding: utf-8


$KCODE = 'UTF-8' unless 'Ruby 1.9'.respond_to?(:encoding)

$:.unshift(File.expand_path('../../lib', __FILE__))

require 'rubygems'
gem 'activesupport', '>=2.1.0'
require 'active_support'

require 'benchmark'
require 'benchmark/scenario'
