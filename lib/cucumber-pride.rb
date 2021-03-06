require "cucumber-pride/version"

require 'rubygems'
require 'cucumber/formatter/progress'

module Cucumber
  module Pride
    class Formatter < Cucumber::Formatter::Progress

      def initialize(step_mother, io, options)
        super
        initialize_colors
        @index = 0
        @size = @colors.size
      end

      private

      def progress(status)
        char = CHARS[status]
        char = rainbow(char) if char == '.'
        @io.print(format_string(char, status))
        @io.flush
      end

      def dump_count(count, what, state=nil)
        super.split(//).map { |x| rainbow x }.join
      end

      #
      # what follows: shamelessly borrowed from https://github.com/ferrous26/rspec-pride
      #

      ESC = "\e["
      NND = "#{ESC}0m"

      if ENV['TERM'] =~ /^xterm(-256color)?$/

        PI_3 = Math::PI / 3

        # Taken, wholesale, from minitest/pride
        def initialize_colors
          # walk red, green, and blue around a circle separated by equal thirds.
          #
          # To visualize, type this into wolfram-alpha:
          #
          #   plot (3*sin(x)+3), (3*sin(x+2*pi/3)+3), (3*sin(x+4*pi/3)+3)

          # 6 has wide pretty gradients. 3 == lolcat, about half the width
          @colors = (0...(6 * 7)).map { |n|
            n *= 1.0 / 6
            r  = (3 * Math.sin(n           ) + 3).to_i
            g  = (3 * Math.sin(n + 2 * PI_3) + 3).to_i
            b  = (3 * Math.sin(n + 4 * PI_3) + 3).to_i

            # Then we take rgb and encode them in a single number using base 6.
            # For some mysterious reason, we add 16... to clear the bottom 4 bits?
            # Yes... they're ugly.

            36 * r + 6 * g + b + 16
          }
        end

        def rainbow string
          color = @colors[@index % @size]
          @index += 1
          "#{ESC}38;5;#{color}m#{string}#{NND}"
        end

      else # Old Low-Res Pride

        def initialize_colors
          @colors = (31..36).to_a
        end

        def rainbow string
          # string = '*' if string == '.'
          color = @colors[@index % @size]
          @index += 1
          "#{ESC}#{color}m#{string}#{NND}"
        end

      end # if ENV['TERM'] =~ /^xterm(-256color)?$/

    end # class Formatter
  end # module Pride
end # module Cucumber
