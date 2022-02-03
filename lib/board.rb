#à l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case).
#Variables d'instance : le Board doit embarquer les 9 BoardCase du jeu afin de pouvoir les lire 
#et les modifier facilement. Il faut les lui attribuer sous forme d'un array ou d'un hash. Aussi, 
#il est utile de compter le nombre de coup joué pour identifier facilement si on arrive au 9ème coup sans vainqueur.
#Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des 
#BoardCases (de " " à "x" ou "o") et vérifie en fonction de la combinaison des BoardCases si la partie est finie 
#(= un joueur a gagné ou bien les 9 cases sont remplies sans vainqueur).

class Board
  attr_accessor :array_cases

  def initialize
    #On crée 9 instances BoardCases rangées dans un array
    @array_cases << BoardCase.new("A1")
    @array_cases << BoardCase.new("A2")
    @array_cases << BoardCase.new("A3")
    @array_cases << BoardCase.new("B1")
    @array_cases << BoardCase.new("B2")
    @array_cases << BoardCase.new("B3")
    @array_cases << BoardCase.new("C1")
    @array_cases << BoardCase.new("C2")
    @array_cases << BoardCase.new("C3")
  end

  def show_game
    puts "  ------------"
    puts "  | 1 | 2 | 3 |"
    puts "  ------------"
    puts "A | #{array_cases[0].value} | #{array_cases[1].value} | #{array_cases[2].value} |"
    puts "  ------------"
    puts "B | #{array_cases[3].value} | #{array_cases[4].value} | #{array_cases[5].value} |"
    puts "  ------------"
    puts "C | #{array_cases[6].value} | #{array_cases[7].value} | #{array_cases[8].value} |"
    puts "  ------------"
  end

  #recommancer une nouvelle partie
  def clean_board
    array_cases[0].value = " "
    array_cases[1].value = " "
    array_cases[2].value = " "
    array_cases[3].value = " "
    array_cases[4].value = " "
    array_cases[5].value = " "
    array_cases[6].value = " "
    array_cases[7].value = " "
    array_cases[8].value = " "
  end

  #méthode qui sert à provoquer un tour : demander au joueur ce qu'il souhaite faire et ajouter X ou O à la BoardCase
  def play_turn(player)
    
    #déterminer le symbole des joueurs
    if player == "01"
        a = "O"
      else 
        a = "X"
    end

    #choix du joueur
    puts "Sur quelle case souhaites-tu jouer ?"
    print "> "
    choice = gets.chomp
    
    #remplissage de la case choisie : 
    #si choix différent du nom d'une case => renvoie au gets.chomp
    #si case déjà remplie => message pour dire que la case est remplie + renvoie au gets.chomp
    #si case == " " => attribuer le symbole
    loop do # https://stackoverflow.com/questions/22459495/looping-through-a-case-statement-in-ruby
        case choice #utilisation de when ... = choice
        when "A1"
          if array_cases[0].state != " "
              puts "Cette case est déjà prise, choisis-en une autre !"
              print "> "
              choice = gets.chomp
          else
              array_cases[0].state = a
              break
          end
        
        when "A2"
          if array_cases[1].state != " "
            puts "Cette case est déjà prise, choisis-en une autre !"
            print "> "
            choice = gets.chomp
        else
            array_cases[0].state = a
            break
          end
        
        when "A3"
            if array_cases[2].state != " "
              puts "Cette case est déjà prise, choisis-en une autre !"
              print "> "
              choice = gets.chomp
            else
              array_cases[2].state = a
              break
            end
        
        when "B1"
            if array_cases[3].state != " "
              puts "Cette case est déjà prise, choisis-en une autre !"
              print "> "
              choice = gets.chomp
            else
              array_cases[3].state = a
              break
            end

        when "B2"
            if array_cases[4].state != " "
              puts "Cette case est déjà prise, choisis-en une autre !"
              print "> "
              choice = gets.chomp
            else
                array_cases[4].state = a
                break
            end
        
        when "B3"
            if array_cases[5].state != " "
              puts "Cette case est déjà prise, choisis-en une autre !"
              print "> "
              choice = gets.chomp
            else
                array_cases[5].state = a
                break
            end

        when "C1"
            if array_cases[6].state != " "
              puts "Cette case est déjà prise, choisis-en une autre !"
              print "> "
              choice = gets.chomp
            else
                array_cases[6].state = a
                break
            end

        when "C2"
            if array_cases[7].state != " "
              puts "Cette case est déjà prise, choisis-en une autre !"
              print "> "
              choice = gets.chomp
            else
                array_cases[7].state = a
                break
            end

        when "C3"
            if array_cases[8].state != " "
              puts "Cette case est déjà prise, choisis-en une autre !"
              print "> "
              choice = gets.chomp
            else
                array_cases[8].state = a
                break
            end
        
        else #si l'entrée ne correspond pas a une case attendue, renvois à gets.chomp
            puts "Tu n'as pas entré une case valide."
            puts "Essaie encore en mettant bien les majuscules : "
            print "> "
            choice = gets.chomp
            end
        end
    end

    def victory
        #renseigner les possibilités de victoire du joueur 01
        if array_cases[0].state == array_cases[1].state && array_cases[1].state == array_cases[2].state && array_cases[2].state == "O"
            puts "O" #première ligne 
        elsif array_cases[3].state == array_cases[4].state && array_cases[4].state == array_cases[5].state && array_cases[5].state == "O"
            puts "O" #deuxième ligne 
        elsif array_cases[6].state == array_cases[7].state && array_cases[7].state == array_cases[8].state && array_cases[8].state == "O"
            puts "O" #troisième ligne
        elsif array_cases[0].state == array_cases[3].state && array_cases[3].state == array_cases[6].state && array_cases[6].state == "O"
            puts "O" #première colonne
        elsif array_cases[1].state == array_cases[4].state && array_cases[4].state == array_cases[7].state && array_cases[7].state == "O"
            puts "O" #deuxième colonne
        elsif array_cases[2].state == array_cases[5].state && array_cases[5].state == array_cases[8].state && array_cases[8].state == "O"
            puts "O" #troisième colonne
        elsif array_cases[0].state == array_cases[4].state && array_cases[4].state == array_cases[8].state && array_cases[8].state == "O"
            puts "O" #première diagonale
        elsif array_cases[2].state == array_cases[4].state && array_cases[4].state == array_cases[6].state && array_cases[6].state == "O"
            puts "O" #deuxième diagonale
        
        #renseigner les possibilités de victoire du joueur 02
        elsif array_cases[0].state == array_cases[1].state && array_cases[1].state == array_cases[2].state && array_cases[2].state == "X"
            puts "X" #première ligne 
        elsif array_cases[3].state == array_cases[4].state && array_cases[4].state == array_cases[5].state && array_cases[5].state == "X"
            puts "X" #deuxième ligne 
        elsif array_cases[6].state == array_cases[7].state && array_cases[7].state == array_cases[8].state && array_cases[8].state == "X"
            puts "X" #troisième ligne
        elsif array_cases[0].state == array_cases[3].state && array_cases[3].state == array_cases[6].state && array_cases[6].state == "X"
            puts "X" #première colonne
        elsif array_cases[1].state == array_cases[4].state && array_cases[4].state == array_cases[7].state && array_cases[7].state == "X"
            puts "X" #deuxième colonne
        elsif array_cases[2].state == array_cases[5].state && array_cases[5].state == array_cases[8].state && array_cases[8].state == "X"
            puts "X" #troisième colonne
        elsif array_cases[0].state == array_cases[4].state && array_cases[4].state == array_cases[8].state && array_cases[8].state == "X"
            puts "X" #première diagonale
        elsif array_cases[2].state == array_cases[4].state && array_cases[4].state == array_cases[6].state && array_cases[6].state == "X"
            puts "X" #deuxième diagonale
        
        #Egalité lorsque toutes les cases sont remplies
        elsif array_cases[0].state !=" " && array_cases[1].state !=" " && array_cases[2].state !=" " && array_cases[3].state !=" " && array_cases[4].state !=" " && array_cases[5].state !=" " && array_cases[6].state !=" " && array_cases[7].state !=" " && array_cases[8].state !=" "
            puts "Match nul"
        else 
        puts false
        end   
    end
end