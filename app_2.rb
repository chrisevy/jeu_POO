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

puts "Quel nom veux-tu donner à ton barbare?" #Initialisation du joueur. 
print"> "
nom = gets.chomp

hero = HumanPlayer.new(nom)

all_mob =  [mob1 = Player.new("Orc"), mob2 = Player.new("Gobelin")] #Initialisation du ennemis. 

while hero.life_points > 0 && (mob1.life_points > 0 || mob2.life_points > 0) 
    #une boucle while qui ne doit s'arrêter que si le HumanPlayer meurt ou si les 2 joueurs "bots"(Player) meurent.
    puts "#----------------------------------------------------#"
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner" 
    puts "attaquer un joueur en vue :"
    puts "0 - #{mob1.name} a #{mob1.life_points} points de vie"
    puts "1 - #{mob2.name} a #{mob2.life_points} points de vie"
    puts "#----------------------------------------------------#"
    choix = gets.chomp
    if choix == "a"
        hero.search_weapon
    elsif choix == "s"
        hero.search_health_pack
    elsif choix == "0"
        if mob1.life_points < 0
            puts "Tu t'acharnes sur un cadavre, c'est drôle mais il reste d'autres ennemis!"
            
        else
        hero.attacks(mob1)
        end
    elsif choix == "1"
        if mob2.life_points < 0
            puts "Tu t'acharnes sur un cadavre, c'est drôle mais il reste d'autres ennemis!"
        else
        hero.attacks(mob2)
        end
    end
    break if  mob1.life_points <= 0 && mob2.life_points <= 0
    puts "La vermine riposte !"
    all_mob.each do |mob|
        if mob.life_points > 0
            
            mob.attacks(hero)
        end
    end
end
puts "La partie est finie"
if hero.life_points > 0
    #maintenant, si on sort de cette boucle while, c'est que la partie est terminée.
    puts "Tu as triomphé de tes ennemis, tu as ta place au Valhalla à la droite de Kromm!"
else
    puts "Mediocre! Tu fais honte à tes illustres ancêtres!"
end

puts "Powered on Ruby"
puts "Created by Chris and P0nt1K"


