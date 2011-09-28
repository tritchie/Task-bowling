module FramesHelper
  def boxes
    box1, box2 = @frame.ball1, @frame.ball2
    if @frame.ball1 == 10
      box1 = nil; box2 = 'X'
    elsif @frame.ball1 + @frame.ball2 == 10
      box2 = '/'
    else
      box1 = '-' if @frame.ball1 == 0
      box2 = '-' if @frame.ball2 == 0
    end
    return [box1, box2]
  end

  def active?
    @game.current_frame == @frameiterator
  end

  def finished?
    if frame.id == 10
      return true if @frame.ball1 == 10 or @frame.ball2 != nil
    else
      return false if finished(Frame.find(@frame.id+1))
    end
  end

end
