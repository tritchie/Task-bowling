class Frame < ActiveRecord::Base
  validates :ball1, :numericality => {:only_integer => true}, :allow_nil => true
  validates :ball2, :numericality => {:only_integer => true}, :allow_nil => true
end
