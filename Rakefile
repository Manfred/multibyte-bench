
task :default => :test

task :test do
  $:.unshift(File.expand_path('../test', __FILE__))
  $:.unshift(File.expand_path('../../manfreds-rails/activesupport/lib', __FILE__))
  Dir.glob('test/**/*_test.rb').each do |test|
    load test
  end
end