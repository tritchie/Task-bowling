class AddGameIdToFrame < ActiveRecord::Migration
  def self.up
    add_column :frames, :game_id, :integer
  end

  def self.down
    remove_column :frames, :game_id
  end
end
