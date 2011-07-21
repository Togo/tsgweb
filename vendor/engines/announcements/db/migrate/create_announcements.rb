class CreateAnnouncements < ActiveRecord::Migration

  def self.up
    create_table :announcements do |t|
      t.string :league
      t.string :teamname
      t.string :hometeam
      t.string :awayteam
      t.integer :goalshome
      t.integer :goalsaway
      t.string :scorerhome
      t.string :scoreraway
      t.datetime :date
      t.string :location
      t.string :squad
      t.text :other
      t.integer :position

      t.timestamps
    end

    add_index :announcements, :id

    load(Rails.root.join('db', 'seeds', 'announcements.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "announcements"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/announcements"})
    end

    drop_table :announcements
  end

end
