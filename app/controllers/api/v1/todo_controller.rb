class Api::V1::TodoController < ApplicationController
  def index
    # @todo = 
    render json: Todo.all
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
