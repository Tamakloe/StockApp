class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.date :date
      t.time :time
      t.string :symbol
      t.string :name
      t.float :low
      t.float :current
      t.float :high
      t.string :exchange

      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
