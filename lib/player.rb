require 'pry'

class Player
    attr_accessor :name, :life_points  
    #cette variable d'instance permet d'accéder à la lecture et ecriture des variables d'instance. 
   
    @@all_mob = [] #array qui contient les ennemies. 


    def initialize(name)
        @name = name
        @life_points = 10
        @@all_mob << self 
        #afin de pouvoir appeler l'instance même durant l'écriture d'une méthode avec "self". 
        #cf ci-dessous la def self.all 
    end

    def self.all 
        return @@all_mob
    end

    def show_state
        puts "#{name} a #{life_points} points de vie"
        #affiche l'état d'un joueur en allant chercher les données stockées dans @name et @life_points
    end
    


    def gets_damage(damage)
        @life_points = @life_points - damage
        if @life_points <= 0
            puts "le vermine #{name} a été tué !"  
        end
        #il calcule les dommages et donc le nombre de vie perdu 
        #et grâce à la boucle "if" on définit qu'à 0 il est mort,
        #et on rajoute un message pour le notifier. 
    end



    def attacks(player_attacked) #permet de faire qu'un joueur attaque un autre. 
        puts "#{name} attaque #{player_attacked.name}"# annonce l'attaque
        @damage = compute_damage #renvoi à la def "compute_damage"
        if @life_points <= 0 
        else
            puts "Il lui infige #{@damage} points de dommage"
        end
        player_attacked.gets_damage(@damage)
        #action de faire subir les dégâts à l'autre. 
    end


    def compute_damage
        return rand(1..6)
        #les dommages seront aléatoires car égaux au résultat, 
        #d'un lancé de dé (= un chiffre au hasard entre 1 et 6). 
    end
end

class HumanPlayer < Player 
# la class HumanPlayer hérite ("<") de la class Player. 
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    #on a récupéré les données de la class hérité en modifiant (life_points) et ajouté une nouvelle donnée.
    end

    def show_state
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
        #affiche l'état d'un joueur en récuperant dans la class Player tout en ajoutant le niveau d'arme. 
    end

    def compute_damage
        rand(1..6) * @weapon_level
        #on fait devenir "weapon_level" un multiplicateur des dégâts.
        #pourront infliger des dégâts compris entre 1 et 6 alors que,
        #les joueurs de type HumanPlayer infligeront des dégâts compris entre "@weapon_level" et "6 x @weapon_level".
      end

    def search_weapon
        @new_weapon_level = rand(1..6) #lancer un "dé" dont le résultat sera compris entre 1 et 6 
        if @new_weapon_level == 6 #Ce lancé de dé sera égal au niveau de la nouvelle arme trouvée.
            puts "Une arme légendaire de niveau #{@new_weapon_level} !!"
        else 
            puts "Tu as trouvé une arme de niveau #{@new_weapon_level}"
        end
        if @new_weapon_level > @weapon_level
            @weapon_level = @new_weapon_level
            puts "Par Kromm!! Cette arme pourfendra mes ennemis!! "
            # On utilise un "if" pour comparer le niveau de cette nouvelle arme 
            #avec celle qu'il possède déjà (@weapon_level).
        else
            #Si l'arme trouvée est d'un niveau strictement supérieur, il la garde.
            #Qui prend alors la valeur de la nouvelle arme et tu affiches un message. 
            puts "Camelote inutile !!" 
            
        end
    end

    def search_health_pack
        @dice_health = rand(1..6) #lancer un "dé" dont le résultat sera compris entre 1 et 6. 
        if @dice_health == 1
            puts "KROOMM !!" # le joueur n'a rien trouvé et on retourne simplement le string. 
        elsif @dice_health == 6
            puts "Un grande potion de soin. Gloire à Kromm! (+80pts de vie)"
            if @life_points + 80 > 100
                @life_points == 100
            else
                @life_points = @life_points + 80
                #résultat est égal à 6, le joueur a trouvé un pack de 80 points de vie. 
                #On va donc augmenter sa vie de 80 points mais sans qu'elle puisse dépasser 100 points. 
            end
        else 
            puts "Une potion de vie! (+50pts de vie)"
            if @life_points + 50 > 100
                @life_points == 100
            else
                @life_points = @life_points + 50
            end
         #résultat compris entre 2 et 5, le joueur a trouvé un pack de 50 points de vie. 
         #On va donc augmenter sa vie de 50 points mais sans qu'elle puisse dépasser 100 points. 
        end

        
    
            
    end
end


 
