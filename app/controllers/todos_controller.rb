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
      @event.create_todo!
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

    if @todo.update(todo_params)
      @event = Event.new
      @event.todo_id = @todo.id
      @event.title = @todo.title
      @event.user = current_user
      if @todo.finisher != params[:finisher]
        @event.update_finisher!
      end

      if @todo.deadline != params[:deadline]
        @event.update_deadline!
      end

      @event.save
      redirect_to team_project_path(@team, @project), notice: "更新成功"
    else
      render :new
    end
  end

  def destroy
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:id])

    if @todo.destroy
      @event = Event.new
      @event.todo_id = @todo.id
      @event.title = @todo.title
      @event.user = current_user
      @event.destroy_todo!
      redirect_to team_project_path(@team, @project), notice: "删除成功"
    else
      render :new
    end

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

    if @todo.finish!
      @event = Event.new
      @event.todo_id = @todo.id
      @event.title = @todo.title
      @event.user = current_user
      @event.finish_todo!
      @todo.destroy
      redirect_to team_project_path(@team, @project), notice: "完成任务"
    else
      render :new
    end

  end

  private

  def todo_params
    params.require(:todo).permit(:title, :finisher, :deadline)
  end

end
