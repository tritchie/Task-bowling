class AddGameIdToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :game_id, :integer
  end

  def self.down
    remove_column :tasks, :game_id
  end
end
