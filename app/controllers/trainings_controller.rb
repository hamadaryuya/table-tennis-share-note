class TrainingsController < ApplicationController
  before_action :comment_set, only: [:edit, :show]

  def new
    @training = Training.new
  end

  def create
    @training = Training.create(training_params)
    if @training.save
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    @training = Training.find(params[:id])
    if @training.update(update_training_params)
      redirect_to "/"
    else
      render :new
    end
    
  end

  def destroy
    training = Training.find(params[:id])
    if training.user_id == current_user.id
      training.destroy
      redirect_to '/'
    end
  end

  private

  def training_params
    params.require(:training).permit(:date, :training_menu, :purpose, :introspection).merge(user_id: current_user.id)
  end

  def update_training_params
    params.require(:training).permit(:date, :training_menu, :purpose, :introspection).merge(user_id: current_user.id)
  end

  def comment_set
    @training = Training.find(params[:id])
    @comment = Comment.new
    @comments = @training.comments.includes(:user)
  end
end
