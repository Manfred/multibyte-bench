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
    
    def self.format_method(method)
      method[5..-1].gsub(/_/, ' ').capitalize
    end
    
    def self.run
      test = new
      
      title = self.to_s.gsub(/test/i, '').capitalize
      puts "#{title}\n#{'='*title.length}"
      Benchmark.bm(12) do |bench|
        scenarios.sort.each do |method|
          test.setup
          10.times { test.send(method) } # Warmup
          bench.report(format_method(method)) do
            N.times { test.send(method) }
          end
          test.teardown
        end
      end
      puts
    end
  end
end