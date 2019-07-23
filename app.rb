require 'bundler'
require 'pry'

Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Ryu")
player2 = Player.new("Ken")
#Donner un nom à nos players. 


puts "A ma droite #{player2.name}"
puts "A ma gauche #{player1.name}"
#Présentation des joueurs. 

puts "Les deux combattants sont en formes !"
player1.show_state
player2.show_state
puts "READY? ----> FIGHT !!"
#Pouvoir voir la forme de chacun des joueurs.  
    
while player1.life_points > 0 && player2.life_points > 0
    #Cette boucle doit tourner jusqu'à ce qu'un des Player 
    #voit son niveau de vie être inférieur ou égal à zéro "break if".
    puts "Passons à la phase d'attaque : "
    player1.attacks(player2)
    break if  player2.life_points <= 0
    player2.attacks(player1)
    puts "Voici l'état de nos combattants"
    player1.show_state
    player2.show_state
   
end

human1 = HumanPlayer.new("Conan") #Donner une identité au joueur humain.   
human1.show_state

binding.pry