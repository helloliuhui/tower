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
    redirect_to team_project_path(@team, @project), notice: "创建成功"
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

    redirect_to team_project_path(@team, @project), notice: "更新成功"
  end

  def destroy
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:id])

    @todo.destroy

    redirect_to team_project_path(@team, @project), notice: "删除成功"
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

    redirect_to team_project_path(@team, @project), notice: "完成任务"
  end

  def unfinish
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:todo_id])

    @todo.unfinish!

    redirect_to team_project_path(@team, @project), notice: "取消完成任务"
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :finisher, :deadline)
  end
end
