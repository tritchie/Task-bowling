class AddPositionToFrame < ActiveRecord::Migration
  def self.up
    add_column :frames, :position, :integer
  end

  def self.down
    remove_column :frames, :position
  end
end
