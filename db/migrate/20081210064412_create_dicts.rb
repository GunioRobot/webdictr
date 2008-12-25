class CreateDicts < ActiveRecord::Migration
  def self.up
    create_table :dicts do |t|
      t.string :name, :description
    end
  end

  def self.down
    drop_table :dicts
  end
end
