class TeamsController < ApplicationController

  before_filter :find_all_teams
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @team in the line below:
    present(@page)
  end

  def show
    @team = Team.find(params[:id])
    @coach = Coach.find(@team.coach_id)
    @co_coach = Coach.find(@team.co_coach_id)
    @employee = Employee.find(@team.admin_id)
    @announcements = Announcement.order('position')

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @team in the line below:
    present(@page)
  end

protected

  def find_all_teams
    @teams = Team.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/teams").first
  end
  

end
