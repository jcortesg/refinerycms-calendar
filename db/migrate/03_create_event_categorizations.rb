class CreateEventCategorizations < ActiveRecord::Migration
  def self.up
    create_table Refinery::EventCategorization.table_name do |t|
      t.integer :event_id
      t.integer :event_category_id
      
      t.timestamps
    end
    
    add_index Refinery::EventCategorization.table_name, :event_id
    add_index Refinery::EventCategorization.table_name, :event_category_id
  end

  def self.down
    drop_table Refinery::EventCategorization.table_name
  end
end
