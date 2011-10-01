class AddWeekToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :week, :date
  end

  def self.down
    remove_column :games, :week
  end
end
