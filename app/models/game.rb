class Game < ActiveRecord::Base
  has_many :frames
  has_many :tasks
end
