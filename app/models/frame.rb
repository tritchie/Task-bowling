class Frame < ActiveRecord::Base

  belongs_to :game
  validates :ball1, :numericality => {:only_integer => true, :allow_nil => true}
  validates :ball2, :numericality => {:only_integer => true, :allow_nil => true}

  validates_each :ball2 do |model, attr, value|
    #if (model.ball1 + model.ball2) > 10
      #model.errors.add("There's only 10 pins! #{model.ball1}, #{model.id}, #{model.ball2}") 
    #end
  end
end

class FrameValidator < ActiveModel::Validator
  def validate(record)
    if options[:fields].any?{|field| record.send(field) == 5 }
      record.errors[:base] << "This person is evil"
    end
  end
end
