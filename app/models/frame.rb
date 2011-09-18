class Frame < ActiveRecord::Base
  def rewrite_totals
    runningtotal = 0
    (1..10).each do |frameid|
      frame = Frame.find(frameid)
      score = frame.ball1 + frame.ball2
      total = runningtotal + score
      if frame.ball2 == 10
        score += strikebonus(frame)
      else if score == 10
        score += sparebonus(frame)
      end
      frame.total = runningtotal + score
    end
  end

  def sparebonus (frame)
    nextframe = frame.next
    if nextframe.ball2 = 10
      return 10 
    else 
      return nextframe.ball1
    end
  end
  def strikebonus (frame)
    nextframe = Frame.next
    if nextframe.ball2 = 10
      return 10 + sparebonus(nextframe)
    else
      return nextframe.ball1 + nextframe.ball2
    end
  end
  def next (frame)
    Frame.find(frame.id+1)
  end
end
end
