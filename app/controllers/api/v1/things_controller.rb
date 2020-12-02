class Api::V1::ThingsController < Api::V1::GraphitiController
  def index
    things = ThingResource.all(params)
    respond_with(things)
  end

  def show
    thing = ThingResource.find(params)
    respond_with(thing)
  end

  def create
    thing = ThingResource.build(params)

    if thing.save
      render jsonapi: thing, status: :created
    else
      render jsonapi_errors: thing
    end
  end

  def update
    thing = ThingResource.find(params)

    if thing.update_attributes
      render jsonapi: thing
    else
      render jsonapi_errors: thing
    end
  end

  def destroy
    thing = ThingResource.find(params)

    if thing.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: thing
    end
  end
end
