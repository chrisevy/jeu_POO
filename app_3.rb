require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

print" 
#----------------------------------------------#
|                 PAR KROM !!                  |
|      Chroniques d'un barbare incompris       |    
|      #-----|=========================>       |
|                                              |
|      <=========================|-----#       |
|                                              |
#----------------------------------------------#
"

puts "

#------------------Bienvenue----------------------#
#-Des hordes de vermines ont envahis les terres,--#
#----------detruis-les au nom de Krom!------------#

"

puts "Quel nom veux-tu donner à ton barbare?"
print"> "
name = gets.chomp
my_game = Game.new(name)

#binding.pry #pour les test pry

# une boucle while qui reprend chaque objet de la class Game
while my_game.is_still_ongoing?
    my_game.menu
    my_game.menu_choice
    my_game.enemies_attack
    my_game.kill_mob
    my_game.show_players
    
end
    my_game.end

puts "Powered on Ruby"
puts "Created by Chris and P0nt1K"
