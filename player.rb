# Represents players, which have a name and a symbol.
class Player

  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

end

