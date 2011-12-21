class CreateEventCategories < ActiveRecord::Migration
  def self.up
    create_table Refinery::EventCategory.table_name do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table Refinery::EventCategory.table_name
  end
end
