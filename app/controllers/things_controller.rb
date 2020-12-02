class ThingsController < ApplicationController
  before_action :current_user_must_be_thing_user, only: %i[edit update destroy]

  before_action :set_thing, only: %i[show edit update destroy]

  def index
    @q = current_user.things.ransack(params[:q])
    @things = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @thing = Thing.new
  end

  def edit; end

  def create
    @thing = Thing.new(thing_params)

    if @thing.save
      message = "Thing was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @thing, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @thing.update(thing_params)
      redirect_to @thing, notice: "Thing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @thing.destroy
    message = "Thing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to things_url, notice: message
    end
  end

  private

  def current_user_must_be_thing_user
    set_thing
    unless current_user == @thing.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

  def set_thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:description, :user_id)
  end
end
