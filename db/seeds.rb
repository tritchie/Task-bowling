# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
if @game = Game.create!
  (1..11).each do |position|
    @game.frames.create(:ball1 => 0, :ball2 => 0, :position => position)
  end
  @game.active_frame = @game.current_frame = @game.frames.first.id
  require "date"
  @game.week = Date.commercial(DateTime.year, DateTime.now.cweek, d=1)
  @game.save!
end

