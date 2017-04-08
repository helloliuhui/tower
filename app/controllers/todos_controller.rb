class TodosController < ApplicationController

  def new
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.new
    @event = Event.new
  end

  def create
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.new(todo_params)

    @todo.user = current_user
    @todo.team = @team
    @todo.project = @project

    if @todo.save
      @event = Event.new
      @event.todo_id = @todo.id
      @event.title = @todo.title
      @event.user = current_user
      @event.save
      redirect_to team_project_path(@team, @project), notice: "创建成功"
    else
      render :new
    end
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
    @comments = @todo.comments
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

  def event_params
    params.require(:event).permit(:user_id, :todo_id)
  end
end
