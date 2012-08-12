require "thor"
require "term/ansicolor"
require "ansi-showcase/version"

# Make coloring available for String's
class String
  include Term::ANSIColor
end

module AnsiShowcase
  class Task < Thor

    SHADES = [ 
      [ :black, :dark ],
      [ :white, :intense_white, :bold ],
      [ :magenta, :intense_magenta, [ :bold, :magenta] ],
      [ :blue, :intense_blue, [ :bold, :blue] ],
      [ :cyan, :intense_cyan, [ :bold, :cyan] ],
      [ :green, :intense_green, [ :bold, :green] ],
      [ :yellow, :intense_yellow, [ :bold, :yellow] ],
      [ :red, :intense_red, [ :bold, :red] ]
    ] 

    EFFECTS = [
      [ :italic, :underline, :underscore ],
      [ :blink, :rapid_blink, :concealed ],
      [ :strikethrough ]
    ]
    
    BACKGROUNDS = [
      [ :on_black ],
      [ :on_white, :on_intense_white, ],
      [ :on_magenta, :on_intense_magenta, ],
      [ :on_blue, :on_intense_blue ],
      [ :on_green, :on_intense_green ],
      [ :on_yellow, :on_intense_yellow ],
      [ :on_red, :on_intense_red ]
    ]

    NEGATIVES = [
      [ :negative, [ :negative, :bold ], [ :negative, :underline ] ],
      [ [ :negative, :black ], [ :negative, :dark ] ],
      [ [ :negative, :blue ], [ :negative, :intense_blue ], [ :negative, :blue, :bold ] ],
      [ [ :negative, :underline ] ],
      [ [ :negative, :red, :on_blue ], [ :negative, :on_green ] ], 
      [ [ :negative, :on_intense_yellow ] ]
    ]

    desc "shades", "Display shades showcase"
    def shades
      puts
      puts "  Shades: "
      puts
      say_palette SHADES
    end

    desc "effects", "Display effects showcase"
    def effects
      puts
      puts "  Effects:"
      puts
      say_palette EFFECTS
    end

    desc "backgrounds", "Display backgrounds showcase"
    def backgrounds
      puts 
      puts "  Backgrounds:"
      puts
      say_palette BACKGROUNDS
    end

    desc "negatives", "Display showcase for negative effects, the ones used in selections"
    def negatives
      puts 
      puts "  Negatives:"
      puts "  Several combinations of the negative (reverse) effect with other"
      puts "  effects are shown in order to make it easy to grasp what it does,"
      puts "  because is not self-evident."
      puts
      say_palette NEGATIVES
    end

    desc "all", "Displays all showcases"
    def all
      puts
      puts "  This is a brief showcase featuring the names of the methods in the "
      puts "  " + "Term::ANSIColor".intense_white + " (term-ansicolor) Ruby Gem for easy coloring using "
      puts "  escape sequences on ANSI terminals."
      puts
      puts "  For more information about term-ansicolor, visit the documentation on "
      puts "  http://github.com/flori/term-ansicolor"
      puts
      puts "  Keep in mind that many of the effects might be unsupported.".intense_white
      puts "  Support varies a lot between terminals and platforms."
      invoke :shades
      invoke :effects
      invoke :backgrounds
      invoke :negatives
      puts "  For a full list of options type: " + "ansi-showcase help".intense_white
      puts
    end

    private
      def say_palette palette
        palette.each do |colorset|
          colorset.each do |color|
            print "\t"
            if color.is_a? Symbol
              print color.to_s.send(color) + "\t"
            else
              to_print = ""
              color.each do |c|
                to_print += "#{c}&"
              end
              to_print = to_print[0..-2]
              color.each do |c|
                to_print = to_print.send(c)
              end
              print to_print + "\t"
            end
          end
          puts
        end 
        puts 
      end
  end
end
