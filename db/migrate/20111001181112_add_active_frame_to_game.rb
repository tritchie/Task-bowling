class AddActiveFrameToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :active_frame, :integer
  end

  def self.down
    remove_column :games, :active_frame
  end
end
