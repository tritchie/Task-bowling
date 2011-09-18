class AddTotalToFrame < ActiveRecord::Migration
  def self.up
    add_column :frames, :total, :integer
  end

  def self.down
    remove_column :frames, :total
  end
end
