module FramesHelper
  def boxes
    box1, box2 = @frame.ball1, @frame.ball2
    if @frame.ball1 == 10
      box1 = nil; box2 = 'X'
    elsif @frame.ball1.to_i + @frame.ball2.to_i == 10
      box2 = '/'
    end
    box1 = '-' if @frame.ball1 == 0
    box2 = '-' if @frame.ball2 == 0
    return [box1, box2]
  end
end
