#!/usr/bin/env ruby
require "term/ansicolor"
extend Term::ANSIColor
#puts dark italic "Hola"
#puts "Blanco normal"
#puts intense_white "Blanco intenso igual"
#puts bold "Brillante (por el bold)"
#puts blue "Simplemente azul"
#puts intense_blue "Intenso azul"
#puts bold blue "Azul bold"
#puts green "Verde"
#puts intense_green "Intenso verde"
#puts bold green "Verde bold?"

shades = [ 
  [ :black, :dark ],
  [ :white, :intense_white, :bold ],
  [ :magenta, :intense_magenta, [ :bold, :magenta] ],
  [ :blue, :intense_blue, [ :bold, :blue] ],
  [ :cyan, :intense_cyan, [ :bold, :cyan] ],
  [ :green, :intense_green, [ :bold, :green] ],
  [ :yellow, :intense_yellow, [ :bold, :yellow] ],
  [ :red, :intense_red, [ :bold, :red] ]
]

effects = [
  [ :italic, :underline, :underscore ],
]

negatives = [
  [ :negative, [ :negative, :bold ], [ :negative, :dark ] ],
  [ [ :negative, :blue ], [ :negative, :intense_blue ] ]
]

# Prints out the given palette construct
# @param [Array] palette
def puts_palette palette
  palette.each do |colorset|
    colorset.each do |color|
      print "\t"
      if color.is_a? Symbol
        print send(color, color.to_s) + "\t"
      else
        print send(color.first, send(color.last, "#{color.first}&#{color.last}") ) + "\t"
      end
    end
    puts
  end 
  puts 
end

puts
puts intense_white "Keep in mind that many of the effects might be unsupported"
puts "Support varies a lot between terminals"
puts
puts "Shades:"
puts_palette shades

puts "Effects:"
puts_palette effects
