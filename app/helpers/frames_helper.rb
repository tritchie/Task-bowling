module FramesHelper
  def box1
    boxes[0]
  end
  def box2
    boxes[1]
  end
  def boxes
    return [nil, nil] if @frame.id >= @game.current_frame
    box1, box2 = @frame.ball1, @frame.ball2
    if @frame.ball1 == 10
      box1 = nil; box2 = 'X'
    elsif @frame.ball1 + @frame.ball2 == 10
      box1 = '-' if @frame.ball1 == 0
      box2 = '/'
    else
      box1 = '-' if @frame.ball1 == 0
      box2 = '-' if @frame.ball2 == 0
    end
    return [box1, box2]
  end
  def total
    @frame.total unless @frame.id >= @game.current_frame
  end

  def active?
    @game.active_frame == @frame.id
  end

  def current?
    @game.current_frame == @frame.id
  end
  def editable?
    @game.current_frame >= @frame.id
  end
  def frameattrs
    if current?
      {:class => 'currentframe'}
    elsif bonusframe?
      {:class => 'bonusframe'}
    else
      {:class => 'frame'}
    end
  end
  def bonusframe?
    @frame.position == 11
  end
end
