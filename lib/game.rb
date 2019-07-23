
class Game
    attr_accessor :hero, :all_mob

    

    def initialize(name)
        @hero = HumanPlayer.new("#{name}")
        @all_mob = [mob1 = Player.new("Orgrim"),
        mob2 = Player.new("Durotan"),
        mob3 = Player.new("Gul'dan"),
        mob4 = Player.new("Zog Zog")] #création des 4 mob directement dans le tableau
    end

    def search #permet de verifier l'Array avec le pry
        return @all_mob 
    end

    def kill_mob #supprime les mob morts du array
        @all_mob.each do |mob|
            if mob.life_points <= 0
                @all_mob.delete(mob)
            end
        end
    end

    def is_still_ongoing? #permet de maintenir la boucle du jeu
        if hero.life_points > 0 && (@all_mob.length > 0) #le jeu continue tant que le héros est en vie et qu'il y'a au moins un mob en vie
            return true
        else
            return false #le jeu s'arrete
        end
    end

    def show_players #affiche l'état du joueur et le nombre de mob restants
        puts "#{hero.show_state}"
        if @all_mob.length > 0 #permet de déterminer le nombre de mob dans l'array est donc dans le jeu
            puts "Il reste #{@all_mob.length} vermine ! " #la longueur de l'array donne le nombre de mob
        else
            puts "Les vermines ont été éradiquées !"
        end
    end

    def menu
        
        puts "#----------------------------------------------------#"
        puts "Quelle action veux-tu effectuer ?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner" 
        puts "attaquer un joueur en vue :"
        i = 0
        @all_mob.each do |mob| #parcours l'array et affiche chaque mob de l'array avec le numéro correspondant
            puts"#{i} - #{mob.name} a #{mob.life_points} points de vie"
            i += 1
        end
        puts "#----------------------------------------------------#"
    end

    def menu_choice
        choix = gets.chomp
        if choix == "a"
            hero.search_weapon
        elsif choix == "s"
            hero.search_health_pack
        elsif choix == "0"
            if @all_mob[0].life_points < 0
                puts "Tu t'acharnes sur un cadavre, c'est drôle mais il reste d'autres ennemis!"
            else
            hero.attacks(@all_mob[0])
            end
        elsif choix == "1"
            if @all_mob[1].life_points < 0
                puts "Tu t'acharnes sur un cadavre, c'est drôle mais il reste d'autres ennemis!"
            else
            hero.attacks(@all_mob[1])
            end
        elsif choix == "2"
            if @all_mob[2].life_points < 0
                puts "Tu t'acharnes sur un cadavre, c'est drôle mais il reste d'autres ennemis!"
            else
            hero.attacks(@all_mob[2])
            end
        elsif choix == "3"
            if @all_mob[3].life_points < 0
                puts "Tu t'acharnes sur un cadavre, c'est drôle mais il reste d'autres ennemis!"
            else
            hero.attacks(@all_mob[3])
            end
        end
    end

    def enemies_attack
        puts "La vermine riposte !"
        all_mob.each do |mob|
            if mob.life_points > 0
                mob.attacks(hero)
            end
        end
    end

    def end
        puts "La partie est finie"
        if hero.life_points > 0
                puts "Tu as triomphé de tes ennemis, tu as ta place au Valhalla à la droite de Kromm!"
            else
                puts "Mediocre! Tu fais honte à tes illustres ancêtres!"
        end
    end
end