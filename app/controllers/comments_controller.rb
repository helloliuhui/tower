class CommentsController < ApplicationController

  def new
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:todo_id])
    @comment = Comment.new
  end

  def create
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:todo_id])
    @comment = Comment.new(comment_params)

    @comment.user = current_user
    @comment.todo = @todo

    if @comment.save
      redirect_to team_project_todo_path(@team, @project, @todo), notice: "创建成功"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :todo_id)
  end

end
