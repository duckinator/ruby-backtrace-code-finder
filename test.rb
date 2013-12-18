#!/usr/bin/env ruby

require './backtrace-code-finder.rb'

class Meep
  def x
    p 7
    p 8
    derp
    p 10
    p 11
  end
end

Meep.new.x
