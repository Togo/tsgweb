class CreateEmployees < ActiveRecord::Migration

  def self.up
    create_table :employees do |t|
      t.string :name
      t.string :function
      t.string :phone
      t.string :email
      t.integer :photo_id
      t.date :since
      t.integer :position

      t.timestamps
    end

    add_index :employees, :id

    load(Rails.root.join('db', 'seeds', 'employees.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "employees"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/employees"})
    end

    drop_table :employees
  end

end
