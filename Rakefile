#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--require lib --require features --format Cucumber::Pride::Formatter"
end
