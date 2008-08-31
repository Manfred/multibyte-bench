# encoding: utf-8

require 'helper'

class MethodsTest < Benchmark::Scenario
  include SharedData

  [:reverse, :upcase, :downcase, :capitalize].each do |method|
    define_method "test_#{method}" do
      STRINGS.each do |string|
        string.send(method)
      end
    end
  end

  run
end
