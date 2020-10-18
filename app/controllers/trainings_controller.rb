class TrainingsController < ApplicationController
  def new
  end

  def create
    Training.create(training_params)
    redirect_to "/"
  end

  def edit
    @training = Training.find(params[:id])
  end

  def show
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    Training.update(update_training_params)
  end

  def destroy
    training = Training.find(params[:id])
     if training.user_id == current_user.id
      training.destroy
      redirect_to "/"
     end
  end

  def training_params
    params.permit(:date, :training_menu, :purpose, :introspection).merge(user_id: current_user.id)
  end

  def update_training_params
    params.require(:training).permit(:date, :training_menu, :purpose, :introspection).merge(user_id: current_user.id)
  end
end
