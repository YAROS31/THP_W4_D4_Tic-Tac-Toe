require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'game.rb'
require 'player.rb'
require 'board.rb'
require 'boardcase'

# cette classe va nous permettre de lancer le jeu. Elle va faire une boucle infinie de parties (on joue tant que 
# les joueurs veulent continuer) et lancer l'instanciation d'un Game.

class Application
  def perform
    ask_name
    game = Game.new
    new_round
  end

end

Application.new.perform