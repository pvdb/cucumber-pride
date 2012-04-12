# encoding: utf-8
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

class Calculator
  def push(n)
    @args ||= []
    @args << n
  end
  
  def add
    @args.inject(0){|n,sum| sum+=n}
  end

  def divide
    @args[0].to_f / @args[1].to_f
  end
end

Before do
  @calc = Calculator.new
end

After do
end

Given /I have entered (\d+) into the calculator/ do |n|
  @calc.push n.to_i
end

When /I press (\w+)/ do |op|
  @result = @calc.send op
end

Then /the result should be (.*) on the screen/ do |result|
  @result.should == result.to_f
end
