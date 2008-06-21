# encoding: utf-8

module Benchmark #:nodoc:
  # Base class for writing usage scenario's for implementations.
  class Scenario
    N = 10000
    
    def setup; end
    def teardown; end
    
    def self.scenarios
      public_instance_methods(true).select { |m| m =~ /^test_/ }
    end
    
    def self.run
      test = new
      test.setup
      scenarios.sort.each do |method|
        puts "#{method}: %s" % Benchmark.measure { N.times { test.send(method) } }.to_s
      end
      test.teardown
    end
  end
end