class TodosController < ApplicationController

  def new
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.new
  end

  def create
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.new(todo_params)

    @todo.user = current_user
    @todo.team = @team
    @todo.project = @project

    @todo.save
    redirect_to team_project_path(@team, @project)
  end

  def edit
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:id])
  end

  def update
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:id])

    @todo.user = current_user
    @todo.project = @project
    @todo.team = @team

    @todo.update(todo_params)

    redirect_to team_project_path(@team, @project)
  end

  def destroy
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:id])

    @todo.destroy

    redirect_to team_project_path(@team, @project)
  end

  def show
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:id])
  end

  def finish
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:todo_id])

    @todo.finish!

    redirect_to team_project_path(@team, @project)
  end

  def unfinish
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:todo_id])

    @todo.unfinish!

    redirect_to team_project_path(@team, @project)
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
