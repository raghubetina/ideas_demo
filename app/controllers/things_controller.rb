class ThingsController < ApplicationController
  before_action :set_thing, only: %i[show edit update destroy]

  def index
    @q = Thing.ransack(params[:q])
    @things = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show; end

  def new
    @thing = Thing.new
  end

  def edit; end

  def create
    @thing = Thing.new(thing_params)

    if @thing.save
      redirect_to @thing, notice: "Thing was successfully created."
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
    redirect_to things_url, notice: "Thing was successfully destroyed."
  end

  private

  def set_thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:description)
  end
end
