class Announcement < ActiveRecord::Base

  acts_as_indexed :fields => [:league, :hometeam, :awayteam, :scorerhome, :scoreraway, :location, :squad, :other]

  validates :league, :presence => true
  
end
