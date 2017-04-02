class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.save
    
    redirect_to :teams
  end

  private

  def team_params
    params.require(:team).permit(:title, :description)
  end
end
