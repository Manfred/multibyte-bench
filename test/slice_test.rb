# encoding: utf-8

require 'helper'

class SliceTest < Benchmark::Scenario
  include SharedData

  def test_accordian
    STRINGS.each do |string|
      "#{string[0..10]} … #{string[-10..-1]}"
    end
  end

  def test_navigation_index
    STRINGS.map { |name| name.first }.sort
  end

  run
end