class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_team_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user

    if @team.save
      redirect_to :teams
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to :teams
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to :teams
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:title, :description)
  end

  def find_team_and_check_permission
    @team = Team.find(params[:id])

    if current_user != @team.user
      redirect_to root_path, alert: "You have no permission"
    end
  end

end
