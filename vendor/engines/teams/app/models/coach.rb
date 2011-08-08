class Coach < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :function, :email, :phone]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :photo, :class_name => 'Image'
end
