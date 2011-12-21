class CreateEvents < ActiveRecord::Migration

  def self.up
    create_table Refinery::Event.table_name, :id => true do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.string :venue_name
      t.string :venue_address
      t.decimal :ticket_price, :precision => 8, :scale => 2
      t.string :ticket_link
      t.text :description
      t.boolean :featured
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    add_index Refinery::Event.table_name, :id

	Refinery::Calendar::Engine.load_seed
  end

  def self.down
    UserPlugin.destroy_all({:name => "events"})

    Page.delete_all({:link_url => "/events"})

    drop_table Refinery::Event.table_name
  end

end
