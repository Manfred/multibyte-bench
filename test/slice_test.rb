# encoding: utf-8

require 'helper'

class SliceTest < Benchmark::Scenario
  def setup
    @strings = [
      'تراك يقوم بحفظ كل الكلمات باستخدام صيغة UTF-8، بما في ذلك الكلمات المستخدمة في صفحات التيكت والويكي.',
      'Българският език работи ли?',
      'Čeština v kódování UTF-8, žádný problém.',
            'אני יכול לאכול זכוכית וזה לא מזיק לי',
      'Проверка русского языка: кажется работает...',
      '’t Ĳ oversteken kan zelfs mét een boot gevaarlijk zijn.'
      ].map { |s| instance_for_implementation(s) }
  end
  
  def test_accordian
    @strings.each do |string|
      result = "#{string[0..10]} … #{string[-10..-1]}"
    end
  end
  
  protected
  
  def instance_for_implementation(string)
    string.mb_chars
  end
  
  run
end