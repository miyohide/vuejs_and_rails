class Api::TasksController < ApplicationController
  # Rails 5.2からprotect_from_forgery with: :exceptionは
  # デフォルト化されたので、それを回避するために下記の記述をしている
  # 本来はCSRF対策をきちんとする必要あり。
  skip_before_action :verify_authenticity_token, raise: false

  def index
    @tasks = Task.order("updated_at DESC")
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render :show, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render :show, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private
  def task_params
    params.fetch(:task, {}).permit(
                               :name, :is_done
    )
  end
end