module FramesHelper
  def box1(frame)
    boxes(frame)[0]
  end
  def box2(frame)
    boxes(frame)[1]
  end
  def boxes(frame)
    return [nil, nil] if frame.position > game_position
    box1, box2 = frame.ball1, frame.ball2
    if frame.ball1 == 10
      box1 = nil; box2 = 'X'
    elsif frame.ball1 + frame.ball2 == 10
      box1 = '-' if frame.ball1 == 0
      box2 = '/'
    else
      box1 = '-' if frame.ball1 == 0
      box2 = '-' if frame.ball2 == 0
    end
    return [box1, box2]
  end
  def total(frame)
    frame.total unless frame.id >= @game.current_frame
  end

  def active?(frame)
    @game.active_frame == frame.id
  end
  def current?(frame)
    @game.current_frame == frame.id
  end
  def empty?(frame)
    frame.ball1 == nel && frame.ball2 == nil
  end
  def incomplete?(frame)
    completed?(frame) == false
  end
  def completed?(frame)
    frame.ball1 != nil && frame.ball2 != nil or
    frame.ball1 == 10
  end
  def finished?(frame)
    frame.position < game_position
  end
  def editable?(frame)
    finished?(frame) or current?(frame)
  end
  def bonus?(frame)
    frame.position == 11
  end
  def box1attrs(frame)
    if bonus?(frame)
      bonusattrs
    else
      {:class => 'box1'}
    end
  end
  def box2attrs(frame)
    if bonus?(frame)
      bonusattrs
    else
      {:class => 'box2'}
    end
  end
  def frameattrs(frame)
    if current?(frame)
      {:class => 'currentframe'}
    elsif bonusframe?(frame)
      bonusattrs
      #{:class => 'bonusframe'}
    else
      {:class => 'frame'}
    end
  end
  def bonusboxes
    box1 = @game.frames.where(:position => 11)[0].ball1
    box2 = @game.frames.where(:position => 11)[0].ball2
    [box1, box2]
  end
  def bonusattrs
    if game_position == 11
      {:class => 'currentframe'}
    else
      {:class => 'box2'}
    end
  end
  def bonusframe?(frame)
    frame.position == 11
  end
  def game_position
    Frame.find(@game.current_frame).position
  end
  def bonus
    if active?(frameat(11))
      render :partial => 'frames/editform',
        :locals => {:frame => frameat(11)}
    else
      render :partial => 'frames/inactiveframe',
        :locals => {:frame => frameat(11)}
    end
  end
  def frameat(position)
    @game.frames.where(:position => position)[0]
  end
end
