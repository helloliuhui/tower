class ProjectsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def new
    @team = Team.find(params[:team_id])
    @project = Project.new
  end

  def create
    @team = Team.find(params[:team_id])
    @project = Project.new(project_params)
    @project.user = current_user
    @project.team = @team

    if @project.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:id])
  end

  def update
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:id])
    @project.update(project_params)

    redirect_to team_path(@team)
  end

  def destroy
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to team_path(@team)
  end

  def show
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:id])
    @todos = @project.todos
  end

  def join
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:id])
    current_user.join!(@project)

    redirect_to team_project_path(@team, @project)
  end

  def quit
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:id])
    current_user.quit!(@project)

    redirect_to team_project_path(@team, @project)
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
