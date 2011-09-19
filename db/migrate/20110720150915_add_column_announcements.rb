class AddColumnAnnouncements < ActiveRecord::Migration
    def self.up
      add_column :announcements, :league_id, :integer
    end

    def self.down
      remove_column :announcements, :league_id
    end
  end