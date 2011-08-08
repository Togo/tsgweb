class Announcement < ActiveRecord::Base

  acts_as_indexed :fields => [:league, :hometeam, :awayteam, :scorerhome, :scoreraway, :location, :squad, :other]

  validates :league, :presence => true
  
  scope :latest, lambda { |*l_params|
     limit( l_params.first || 10)
   }
  
end
