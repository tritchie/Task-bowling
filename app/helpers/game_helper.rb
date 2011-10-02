module GameHelper
  def getframeatposition (position)
    @game.frames.where(:position => position)[0]
  end
end
