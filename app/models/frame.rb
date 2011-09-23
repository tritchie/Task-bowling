class Frame < ActiveRecord::Base

  validates :ball1, :numericality => {:only_integer => true}, :allow_nil => true
  validates :ball2, :numericality => {:only_integer => true}, :allow_nil => true

  validates_each :ball2 do |model, attr, value|
    if (model.ball1.to_i + value.to_i) > 10
      model.errors.add(attr, "There's only 10 pins! #{model.ball1.to_i}, #{model.id}, #{value}") 
    end
    #fix nils
    if model.ball1.nil? && model.ball2 != nil #e.g. nil, 5
      model.ball1 = 0
    #elsif Frame.framefinished?(model)
    #  model.ball1 = 0 if model.ball1.nil?
    #  model.ball2 = 0 if model.ball2.nil?
    end
  end

  def framefinished?(frame)
    if frame.id == 10
      return true if frame.ball1 == 10 or frame.ball2 != nil
    else
      return false if framefinished(Frame.find(frame.id+1))
    end
  end
end

class FrameValidator < ActiveModel::Validator
  def validate(record)
    if options[:fields].any?{|field| record.send(field) == 5 }
      record.errors[:base] << "This person is evil"
    end
  end
end
