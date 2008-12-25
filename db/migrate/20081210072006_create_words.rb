class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.integer :dict_id
      t.string :keyword
      t.text :definition
    end
  end

  def self.down
    drop_table :words
  end
end
