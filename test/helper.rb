# encoding: utf-8


$KCODE = 'UTF-8' unless 'Ruby 1.9'.respond_to?(:encoding)

$:.unshift(File.expand_path('../../lib', __FILE__))

require 'active_support'

require 'benchmark'
require 'benchmark/scenario'

module SharedData
  def self.instance_for_implementation(string)
    string.mb_chars
  end

  STRINGS = [
    'تراك يقوم بحفظ كل الكلمات باستخدام صيغة UTF-8، بما في ذلك الكلمات المستخدمة في صفحات التيكت والويكي.',
    'Българският език работи ли?',
    'Čeština v kódování UTF-8, žádný problém.',
          'אני יכול לאכול זכוכית וזה לא מזיק לי',
    'Проверка русского языка: кажется работает...',
    '’t Ĳ oversteken kan zelfs mét een boot gevaarlijk zijn.'
    ].map { |s| instance_for_implementation(s) }
end