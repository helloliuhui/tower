class Account::ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
end