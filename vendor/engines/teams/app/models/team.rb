class Team < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :league, :training, :email, :fussballde]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :photo, :class_name => 'Image'
end
