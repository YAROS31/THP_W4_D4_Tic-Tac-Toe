class BoardCase
  #1 Boardcase = 1 case du tableau. Il en faut donc 9
  
  attr_accessor :state, :name
  # state = valeur de la case : " ", O ou X
  # name = nom de la case / position : A1, B2, etc
  
  def initialize(state,name)
    @state = state
    @name = name
  end
  
end