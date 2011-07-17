class CreateCoaches < ActiveRecord::Migration

  def self.up
    create_table :coaches do |t|
      t.string :name
      t.string :function
      t.string :email
      t.string :phone
      t.integer :photo_id
      t.date :since
      t.integer :position

      t.timestamps
    end

    add_index :coaches, :id

    load(Rails.root.join('db', 'seeds', 'coaches.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "coaches"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/coaches"})
    end

    drop_table :coaches
  end

end
