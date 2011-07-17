class Employee < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :function, :phone, :email]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :photo, :class_name => 'Image'
end
