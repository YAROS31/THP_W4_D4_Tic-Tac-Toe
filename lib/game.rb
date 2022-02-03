# cette classe s'occupe de gérer toute la partie. À l'initialisation elle crée 2 instances de Player, 
# et 1 instance de Board.
# Variables d'instance : tu peux lui rattacher les 2 players (sous forme d'un array), le Board, et des informations
# annexes comme "quel joueur doit jouer ?", "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)", etc.
# Méthodes : Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case), 
# s'occupe de finir la partie si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.
require_relative 'board'
require_relative 'player'
require_relative 'boardcase'

#réutilisation des méthodes de la classes Board (board_display, board_new, play_turn et victory)
class Game < Board
  attr_accessor :board, :current_player, :all_players_array

  def initialize
    @board = board.new
    @current_player = player1
    @players = []
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
  end

  def ask_name(player1, player2)
    puts "Player One, Comment puis-je vous appeler ?"
    print "> "
    player1 = gets.chomp
    @players << Player.new(player1, "O")
    puts "Enchanté #{player1}, vous jouerez avec les 'O'."
    puts "Player Two, Comment puis-je vous appeler ?"
    print "> "
    player2 = gets.chomp
    @players << Player.new(player2, "X")
    puts "Enchanté #{player2}, vous jouerez avec les 'X'."
  end

  def select_player
    while @board.victory != false && @board.victory != "X" && @board.victory != "O"
      @players.each { |i| play_turn(i) }
    end
  end

  def who_won
    if board.victory == "O"
      puts "Bravo #{players[0].name}, tu as gagné !"
    elsif board.victory == "X"
      puts "Bravo #{players[1].name}, tu as gagné !"
    elsif board.victory == "Match nul"
      puts "Match nul !"
  end

  def new_round
    board.board_new #nettoie le tableau pour une nouvelle partie
  end
end
end
