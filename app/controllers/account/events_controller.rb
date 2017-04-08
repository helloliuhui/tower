class Account::EventsController < ApplicationController
  def index
    @todos = Todo.all
  end
end
