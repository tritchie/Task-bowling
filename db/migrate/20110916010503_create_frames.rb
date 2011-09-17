class CreateFrames < ActiveRecord::Migration
  def self.up
    create_table :frames do |t|
      t.integer :ball1
      t.integer :ball2

      t.timestamps
    end
  end

  def self.down
    drop_table :frames
  end
end
